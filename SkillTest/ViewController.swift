//
//  ViewController.swift
//  SkillTest
//
//  Copyright © 2020 Gleb Stolyarchuk. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
// MARK: - Objects
    var segm    = UISegmentedControl()
    
// MARK: Parameters
    let padding = CGFloat(15)
    
// MARK:  VC's
    let task1   = Task1()
    let task2   = Task2()
    let task3   = Task3()
    
// MARK: - Config view
    func setupView() {
        configSegm()
        updateConstraints()
    }
    
    func configSegm() {
        let items = ["a", "b", "c", "d", "e"]
            segm = UISegmentedControl(items: items)
            segm.addTarget(self, action: #selector(taskDidChange(_:)), for: .valueChanged)
    }
    
// MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
// MARK: UpdateConstraints
    func updateConstraints() {
        for v in [segm] {
            view.addSubview(v)
            v.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            segm.topAnchor.constraint(equalTo: safeArea.centerYAnchor),
            segm.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: padding),
            segm.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -padding),
        ])
    }
    
//  MARK: - Logic
    @objc func taskDidChange(_ segmControl: UISegmentedControl){
            switch segm.selectedSegmentIndex {
            case 0: present(task1, animated: true, completion: nil)
            case 1: present(task2, animated: true, completion: nil)
            case 2: present(task3, animated: true, completion: nil)
            case 3: break
            case 4: break
            default: break
        }
    }
}
