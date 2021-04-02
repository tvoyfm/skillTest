//
//  TaskVC.swift
//  SkillTest
//
//  Copyright © 2020 Gleb Stolyarchuk. All rights reserved.
//

import UIKit

class TaskVC: UIViewController {
    
// MARK: - Parameters
    let LRpadding: CGFloat = 16.0

// MARK: - Objects
    let model: TaskViewModelProtocol = TaskViewModel()
    let taskView = TaskView()
    
// MARK: - Config
    func configView() {
        func configTable() {
            taskView.setClearBackground()
            taskView.setDataSourceTable(source: self)
            taskView.registerCellForTable(cellClass: TaskTableViewCell.self, identifier: model.cellIdentifier)
        }

        func configButton() {
            taskView.setTargetButton(target: self, selector: #selector(addTask))
        }

        // Call all methods
        configTable()
        configButton()
    }

// MARK: - Setup UI
    func setupUI() {
        let safeArea = view.safeAreaLayoutGuide
        
        func setupTaskView() {
            view.addSubview(taskView)
            taskView.translatesAutoresizingMaskIntoConstraints = false
            
            let constraints = [
                taskView.topAnchor.constraint(equalTo: safeArea.topAnchor),
                taskView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
                taskView.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: LRpadding),
                taskView .rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: -LRpadding)
            ]
            NSLayoutConstraint.activate(constraints)

        }
        
        // Call all methods
        setupTaskView()
        
        if Settings.nextId == 0 {
            presentStartPopUp()
        }
    }
    
// MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        setupUI()
    }
    
// MARK: - Functions
    @objc func addTask() {
        let alert = UIAlertController(
            title: model.addTaskAlertTitle,
            message: model.addTaskAlertMessage,
            preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: nil)
        
        alert.addAction(UIAlertAction(title: model.addTaskAlertAddActionTitle, style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: model.addTaskAlertCloseActionTitle, style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields![0]
            if textField?.text != "" {
                self.model.addTask(textField!.text!)
                self.taskView.reloadTable()
            }
        }))
        present(alert, animated: true)
    }
}

// MARK: - Table Data Source
extension TaskVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.allTasksCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let allTasks = model.allTasks()
        
        let cell = tableView.dequeueReusableCell(withIdentifier: model.cellIdentifier, for: indexPath) as! TaskTableViewCell
            
            cell.currentTask = allTasks[indexPath.row]
        
            cell.deleteClosure = {
                let alert = UIAlertController(title: self.model.deleteAlertTitle, message:  self.model.deleteAlertMessage, preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: self.model.deleteAlertCloseActionTitle, style: .cancel, handler: nil))
                        alert.addAction(UIAlertAction(title: self.model.deleteAlertActionTitle,
                                                      style: .destructive,
                                                      handler: { action in
                                                        self.model.deleteTask(cell.currentTask!)
                                                        self.taskView.reloadTable()
                        }))
                    self.present(alert, animated: true)
            }
        
            cell.layer.backgroundColor = UIColor.clear.cgColor
            cell.cellDelegate = taskView
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

// MARK: - First time start extension
extension TaskVC {
    func presentStartPopUp() {
        DispatchQueue.main.async {
            self.model.addTask(self.model.firstTaskTitle)
            self.taskView.reloadTable()
            
            let alert = UIAlertController(
                title: self.model.firstAlertTitle,
                message: self.model.firstAlertMessage,
                preferredStyle: .actionSheet)
            
            alert.addAction(UIAlertAction(title: self.model.firstAlertActionTitle, style: .default, handler: nil))
            
            self.present(alert, animated: true)
        }
    }
}
