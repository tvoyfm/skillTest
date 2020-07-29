//
//  Third3VC.swift
//  SkillTest
//
//  Copyright © 2020 Gleb Stolyarchuk. All rights reserved.
//

import UIKit

class Third3VC: UIViewController {
    
    var img1 = UIImageView()
    var img2 = UIImageView()

        override func viewDidLoad() {
            super.viewDidLoad()
            execImages()
            view.backgroundColor = .purple
        }
        
        func execImages() {
        // Картинка 1
            img1.translatesAutoresizingMaskIntoConstraints = false
            img1.contentMode = .scaleAspectFill
            img1.image = UIImage(named: "photo (0)")!
            img1.clipsToBounds = true
            view.addSubview(img1)
            
            NSLayoutConstraint.activate([
                img1.widthAnchor.constraint(equalTo: view.widthAnchor),
                img1.bottomAnchor.constraint(equalTo: view.centerYAnchor.self),
                img1.topAnchor.constraint(equalTo: view.topAnchor)
            ])
        // Картинка 2
            img2.translatesAutoresizingMaskIntoConstraints = false
            img2.contentMode = .scaleAspectFill
            img2.image = UIImage(named: "photo (1)")!
            img2.clipsToBounds = true
            view.addSubview(img2)
            
            NSLayoutConstraint.activate([
                img2.widthAnchor.constraint(equalTo: view.widthAnchor),
                img2.topAnchor.constraint(equalTo: view.centerYAnchor.self),
                img2.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }

}
