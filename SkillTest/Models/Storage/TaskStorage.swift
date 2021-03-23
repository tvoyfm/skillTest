//
//  TaskStorage.swift
//  SkillTest
//
//  Copyright © 2021 Gleb Stolyarchuk. All rights reserved.
//

import Foundation
import RealmSwift

class TaskStorage {
    static let storage = TaskStorage()
    
    private let realm = try! Realm()

//MARK: - Functions
    // Write new task
    func addTask(_ task: Task) {
       try! realm.write {
            realm.add(task)
        }
    }
    
    // Change task state by id
    func changeState(_ task: Task) -> Task {
        if let task = taskById(task.id) {
            try! realm.write {
                switch task.state {
                    case .off:  task.state = .on
                    case .on:   task.state = .off
                    }
                }
            }
        print("Задача \(task.title) : \(task.state.desc)")
        return task
    }
    
    // Change task title by id
    func changeTitle(_ task: Task, newTitle: String) -> Task {
        if let task = taskById(task.id) {
            try! realm.write {
                task.title = newTitle
                }
            }
        print("Новое имя = \(task.title)")
        return task
    }
    
    // Delete task by id
    func deleteTask(_ task: Task) {
        if let task = taskById(task.id) {
            try! realm.write {
                realm.delete(task)
                }
            }
    }

    // Return all tasks as array
    func allTasks() -> [Task] {
        let array = realm.objects(Task.self).toArray(ofType: Task.self) as [Task]
        return array
    }
    
    // Return task by id
    func taskById(_ id: Int) -> Task? {
        let result = allTasks().filter { $0.id == id }.first
        return result
    }
    
//MARK: - Utilities
    func printAll() {
        print("-----------------------")
        let allTasks = realm.objects(Task.self)
        allTasks.forEach({ print("\($0)") })
        print("-----------------------")
    }

}


//MARK: - Extensions for Realm
extension Results {
    func toArray<T>(ofType: T.Type) -> [T] {
        var array = [T]()
        for i in 0 ..< count {
            if let result = self[i] as? T {
                array.append(result)
            }
        }
        return array
    }
}
