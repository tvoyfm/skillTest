//
//  FirstTaskViewController.swift
//  SkillTest
//
//  Copyright © 2020 Gleb Stolyarchuk. All rights reserved.
//

import UIKit

class FirstTaskViewController: UIViewController {
    
    var galleryView = UIImageView()
    var goButton    = UIButton()
    var backButton  = UIButton()
    
    // Набор параметров для смены изображений
    var i = 0
    var picNumber = 0
    var picCount = 10

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        createGalleryView()
        createButtons()
    }
    
    func createGalleryView(){
    // Настройка view для галереи
        galleryView.translatesAutoresizingMaskIntoConstraints = false
        galleryView.backgroundColor = UIColor.gray
        galleryView.image = UIImage(named: "photo (\(i))")
        view.addSubview(galleryView)
        
        NSLayoutConstraint.activate([
            galleryView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            galleryView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            galleryView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            galleryView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -120)
        ])
    }

    func createButtons(){
    // Настройки кнопки "Вперед"
        goButton.setTitle("Вперед", for: UIControl.State.normal)
        goButton.setTitleColor(UIColor.systemBlue, for: UIControl.State.normal)
        goButton.setTitleColor(UIColor.systemYellow, for: UIControl.State.highlighted)
        goButton.translatesAutoresizingMaskIntoConstraints = false
        goButton.tag = 1 //forward
        goButton.addTarget(self, action: #selector(execGalleryAction), for: .touchUpInside)
        view.addSubview(goButton)
        
        NSLayoutConstraint.activate([
            goButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 65),
            goButton.topAnchor.constraint(equalTo: galleryView.bottomAnchor, constant: 20)
        ])
        
    // Настройки кнопки "Назад"
        backButton.setTitle("Назад", for: UIControl.State.normal)
        backButton.setTitleColor(UIColor.systemBlue, for: UIControl.State.normal)
        backButton.setTitleColor(UIColor.systemYellow, for: UIControl.State.highlighted)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.tag = 0
        backButton.addTarget(self, action: #selector(execGalleryAction), for: .touchUpInside)
        view.addSubview(backButton)
        
        NSLayoutConstraint.activate([
            backButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: -65),
            backButton.topAnchor.constraint(equalTo: galleryView.bottomAnchor, constant: 20)
        ])
    }

    @objc func execGalleryAction(sender: UIButton) {
        switch sender.tag {
        case 1 : i += 1
        case 0 : i -= 1
        default: i = 0
        }
            picNumber = i % picCount
            let picName = "photo (\(abs(picNumber)))"
            let pic: UIImage = UIImage(named: picName)!
            galleryView.image = pic
        
        // Для отладки
        // print("next pic = \(picName) \(i) \(picNumber)")
    }
}
