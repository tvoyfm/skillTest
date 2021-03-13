//
//  Category.swift
//  SkillTest
//
//  Created by Глеб Столярчук on 10/03/2021.
//  Copyright © 2021 Gleb Stolyarchuk. All rights reserved.
//

import Foundation

class Category {
    let name        : String
    let imageURL    : URL?
    
    init?(data: NSDictionary) {
        guard   let name         = data["name"]   as? String,
                let imageString  = data["image"]  as? String
            else { return nil }
        
        self.name       = name
        self.imageURL   = (imageString != "") ? URL(string: "https://blackstarwear.ru/\(imageString)") : nil
    }
}
