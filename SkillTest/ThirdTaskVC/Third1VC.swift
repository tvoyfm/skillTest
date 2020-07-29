//
//  Third1ViewController.swift
//  SkillTest
//
//  Copyright © 2020 Gleb Stolyarchuk. All rights reserved.
//

import UIKit

class Third1VC: UIViewController {
    var textField1 = UITextField()
    var textField2 = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        execTextFields()
    }
    
    func execTextFields() {
    // Поле 1
        textField1.translatesAutoresizingMaskIntoConstraints = false
        textField1.borderStyle = .roundedRect
        view.addSubview(textField1)
        
        NSLayoutConstraint.activate([
            textField1.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            textField1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField1.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -50 )])
        
    // Поле 2
        textField2.translatesAutoresizingMaskIntoConstraints = false
        textField2.borderStyle = .roundedRect
        view.addSubview(textField2)
        
        NSLayoutConstraint.activate([
            textField2.topAnchor.constraint(equalTo: textField1.bottomAnchor, constant: 15),
            textField2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField2.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -50 )])
    }
}
