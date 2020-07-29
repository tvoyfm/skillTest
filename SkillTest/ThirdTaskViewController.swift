//
//  ThirdTaskViewController.swift
//  SkillTest
//
//  Created by BCS QA on 18.07.2020.
//  Copyright © 2020 Gleb Stolyarchuk. All rights reserved.
//

import UIKit

class ThirdTaskViewController: UIViewController {

    let VC1 = Third1VC()
    let VC2 = Third2VC()
    let VC3 = Third3VC()
    
    enum Segues {
       static let firstTask = "firstTask"
    }

    var segmControl = UISegmentedControl()
    var segmView = UIView()
    var underSegmView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createSegmentView()
        createSegmentedViewControl()
        createUnderSegmentView()
        
        segmControl.selectedSegmentIndex = 0
        showVC(VC1)
    }
    
    func createSegmentView(){
    // Настройка view
        segmView.frame = view.bounds
        segmView.translatesAutoresizingMaskIntoConstraints = false
        segmView.backgroundColor = UIColor.systemBackground
        view.addSubview(segmView)
    }
    
    func createSegmentedViewControl() {
        let items = ["1️⃣", "2️⃣", "3️⃣"]
        segmControl = UISegmentedControl(items: items)
        segmControl.addTarget(self, action: #selector(taskDidChange(_:)), for: .valueChanged)
        segmControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmControl)
        
        NSLayoutConstraint.activate([
            segmControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            segmControl.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
        ])
        
    // Заголовок
        let segmLabel = UILabel()
        segmLabel.text = "Выбери подзадание, [username]"
        segmLabel.textColor = UIColor.black
        segmLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmLabel)
        
        NSLayoutConstraint.activate([
            segmLabel.bottomAnchor.constraint(equalTo: segmControl.topAnchor, constant: -15),
            segmLabel.centerXAnchor.constraint(equalTo: segmControl.centerXAnchor)
        ])
    }
    
    @objc func taskDidChange(_ segmControl: UISegmentedControl){
    switch segmControl.selectedSegmentIndex{
    case 0: showVC(VC1)
    case 1: showVC(VC2)
    case 2: showVC(VC3)
    default: print("default")
        }
    }
    
    func createUnderSegmentView(){
    // Настройка view
        underSegmView.translatesAutoresizingMaskIntoConstraints = false
        underSegmView.backgroundColor = .systemBackground
        underSegmView.clipsToBounds = true
        view.addSubview(underSegmView)
        
        NSLayoutConstraint.activate([
            underSegmView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            underSegmView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            underSegmView.topAnchor.constraint(equalTo: segmControl.bottomAnchor, constant: 10),
            underSegmView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
    
    func showVC(_ vc: UIViewController) {
        addChild(vc)
        vc.view.translatesAutoresizingMaskIntoConstraints = false
        underSegmView.addSubview(vc.view)
        
        NSLayoutConstraint.activate([
            vc.view.widthAnchor.constraint(equalTo: underSegmView.widthAnchor),
            vc.view.heightAnchor.constraint(equalTo: underSegmView.heightAnchor)
        ])
    }
}
