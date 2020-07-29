//
//  ViewController.swift
//  SkillTest
//
//  Copyright © 2020 Gleb Stolyarchuk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let firstTask   = FirstTaskViewController()
    let secondTask  = SecondTaskViewController()
    let thirdTask   = ThirdTaskViewController()
    
    var segmControl = UISegmentedControl()
    var taskView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        createTaskSegmentedControl()
        //createTaskView()
    }
    
    func createTaskSegmentedControl() {
        let items = ["1️⃣", "2️⃣", "3️⃣"]
        segmControl = UISegmentedControl(items: items)
        segmControl.addTarget(self, action: #selector(taskDidChange(_:)), for: .valueChanged)
        segmControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmControl)
        
        NSLayoutConstraint.activate([
            segmControl.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            segmControl.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
        ])
        
    // Заголовок
        let segmLabel = UILabel()
        segmLabel.text = "Выбери задание"
        segmLabel.textColor = UIColor.black
        segmLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmLabel)
        
        NSLayoutConstraint.activate([
            segmLabel.bottomAnchor.constraint(equalTo: segmControl.topAnchor, constant: -15),
            segmLabel.centerXAnchor.constraint(equalTo: segmControl.centerXAnchor)
        ])
        
    }
    
    func createTaskView(){
        taskView.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        taskView.translatesAutoresizingMaskIntoConstraints = false
        taskView.backgroundColor = UIColor.green
        view.addSubview(taskView)
        
        NSLayoutConstraint.activate([
            taskView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            taskView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            taskView.topAnchor.constraint(equalTo: segmControl.bottomAnchor, constant: 20),
            taskView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150)
        ])
    }
    
    @objc func taskDidChange(_ segmControl: UISegmentedControl){
        switch segmControl.selectedSegmentIndex{
        case 0: // Задание 1
            present(firstTask, animated: true, completion: nil)
        case 1: // Задание 2
            present(secondTask, animated: true, completion: nil)
        case 2: // Задание 3
            present(thirdTask, animated: true, completion: nil)
        default:
            print("def")
        }
    }
    

}
