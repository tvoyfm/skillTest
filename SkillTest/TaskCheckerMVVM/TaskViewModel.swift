//
//  TaskViewModel.swift
//  SkillTest
//
//  Copyright © 2021 Gleb Stolyarchuk. All rights reserved.
//

import Foundation
import UIKit

class TaskViewModel {
// MARK: - Parameters
    let firstAlertTitle:                String = "Привет!"
    let firstAlertMessage:              String = """
                                                 Для добавления задачи используй кнопку внизу экран
                                                 
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

// MARK: - Objects
    let view = TaskView()
    let storage = TaskStorage.storage
    
// MARK: - Support table func
    func reloadTable() {
        view.table.reloadData()
    }
    
    func registerCellForTable(cellClass: AnyClass?, identifier: String) {
        view.table.register(cellClass, forCellReuseIdentifier: identifier)
    }
    
    func setDataSourceTable(source: UITableViewDataSource) {
        view.table.dataSource = source
    }
    
    func setDelegateTable(source: UITableViewDelegate) {
        view.table.delegate = source
    }
    
    func setClearBackground() {
        view.table.backgroundColor = .clear
        view.table.separatorStyle = .none
        view.table.separatorColor = .clear
    }
    
    func setTargetButton(target: Any, selector: Selector) {
        view.addBtn.addTarget(target, action: selector, for: .touchUpInside)
    }
    
// MARK: - Work with storage
    func deleteTask(_ task: Task) {
        storage.deleteTask(task)
        reloadTable()
    }
    
    func addTask(_ title: String) {
        let task = Task(title)
        storage.addTask(task)
        reloadTable()
    }
    
    func allTasks() -> [Task] {
        return storage.allTasks()
    }
    
    func allTasksCount() -> Int {
        return storage.allTasks().count
    }
    
}
