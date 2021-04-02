//
//  TaskViewModel.swift
//  SkillTest
//
//  Copyright © 2021 Gleb Stolyarchuk. All rights reserved.
//

import Foundation

// MARK: - Protocol for model
protocol TaskViewModelProtocol {
    var storage: TaskStorage { get }
    var cellIdentifier:                 String { get }
    
    func deleteTask(_ task: Task)
    func addTask(_ title: String)
    func allTasks() -> [Task]
    func allTasksCount() -> Int
    
    // Text for alerts
    var firstAlertTitle:                String { get }
    var firstAlertMessage:              String { get }
    var firstAlertActionTitle:          String { get }
    var firstTaskTitle:                 String { get }
    
    var addTaskAlertTitle:              String { get }
    var addTaskAlertMessage:            String { get }
    var addTaskAlertAddActionTitle:     String { get }
    var addTaskAlertCloseActionTitle:   String { get }
    
    var deleteAlertTitle:               String { get }
    var deleteAlertMessage:             String { get }
    var deleteAlertActionTitle:         String { get }
    var deleteAlertCloseActionTitle:    String { get }
}

// MARK: - Default model
class TaskViewModel: TaskViewModelProtocol {
    let firstAlertTitle:                String = "Привет!"
    let firstAlertMessage:              String = """
                                                 Для добавления задачи используй кнопку внизу экрана
                                                 
                                                 Индикатор справа от текста задачи обозначает её статус, нажми чтобы поменять
                                                 
                                                 Если хочешь удалить задачу жми долго на её текст
                                                 """
    let firstAlertActionTitle:          String = "Спасибо, я понял"
    let firstTaskTitle:                 String = "Тестовая задача"
    
    let addTaskAlertTitle:              String = ""
    let addTaskAlertMessage:            String = "Укажите текст для задачи"
    let addTaskAlertAddActionTitle:     String = "Закрыть"
    let addTaskAlertCloseActionTitle:   String = "Сохранить"
    
    let deleteAlertTitle:               String = "Подтвердите"
    let deleteAlertMessage:             String = "Вы хотите удалить задачу?"
    let deleteAlertActionTitle:         String = "Да"
    let deleteAlertCloseActionTitle:    String = "Нет"
    
    let cellIdentifier:                 String = "TaskTableViewCell"

    let storage = TaskStorage.storage
}

extension TaskViewModelProtocol {
// MARK: - Default work with storage
    func deleteTask(_ task: Task) {
        storage.deleteTask(task)
    }
    
    func addTask(_ title: String) {
        let task = Task(title)
        storage.addTask(task)
    }
    
    func allTasks() -> [Task] {
        return storage.allTasks()
    }
    
    func allTasksCount() -> Int {
        return storage.allTasks().count
    }
}
