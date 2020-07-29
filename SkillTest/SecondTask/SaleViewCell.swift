//
//  SaleViewCell.swift
//  SkillTest
//
//  Created by BCS QA on 19.07.2020.
//  Copyright © 2020 Gleb Stolyarchuk. All rights reserved.
//

import UIKit

class SaleViewCell: UICollectionViewCell {
    
    let img = UIImageView()
    let lbl = UILabel()

    func generateSaleCell(image: AppImage){
  
        self.clipsToBounds = true
        
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.image = UIImage(named: image.pic)
        img.clipsToBounds = true
        self.addSubview(img)

        //lbl.frame = (CGRect(x: 10, y: 10, width: 10, height: 100))
        lbl.backgroundColor = .systemBackground
        lbl.text = image.name
        lbl.textColor = UIColor.black
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(lbl)
        
        NSLayoutConstraint.activate([
            img.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            img.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            lbl.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            lbl.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            lbl.widthAnchor.constraint(equalTo: self.widthAnchor),
            lbl.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
}
