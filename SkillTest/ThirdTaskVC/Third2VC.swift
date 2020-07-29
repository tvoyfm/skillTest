//
//  Third2VC.swift
//  SkillTest
//
//  Copyright © 2020 Gleb Stolyarchuk. All rights reserved.
//

import UIKit

class Third2VC: UIViewController {
    var button1 = UIButton()
    var button2 = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        execButtons()
        view.backgroundColor = .blue
    }
    
    func execButtons() {
    // Кнопка 1
        button1.translatesAutoresizingMaskIntoConstraints = false
        button1.setTitle("Кнопка 1", for: .normal)
        button1.setTitleColor(.white, for: .normal)
        button1.setTitleColor(.lightGray, for: .highlighted)
        view.addSubview(button1)
        
        NSLayoutConstraint.activate([
            button1.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -15),
            button1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button1.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -50 )])
    // Кнопка 2
        button2.translatesAutoresizingMaskIntoConstraints = false
        button2.setTitle("Кнопка 2", for: .normal)
        button2.setTitleColor(.white, for: .normal)
        button2.setTitleColor(.lightGray, for: .highlighted)
        view.addSubview(button2)
        
        NSLayoutConstraint.activate([
            button2.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 15),
            button2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button2.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -50 )])
}

}
