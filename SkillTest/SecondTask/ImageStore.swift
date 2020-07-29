//
//  ImageStore.swift
//  SkillTest
//
//  Copyright © 2020 Gleb Stolyarchuk. All rights reserved.
//

import Foundation

var picCount = 10

struct AppImage {
    var name: String
    var pic: String // Почему-то не дал сразу UIImage, поэтому сделал String
}

class MiniGallery {
    var appImage = [AppImage]()
    
    init() {
        setupImages()
    }
    
    func setupImages() {
        for i in 0...picCount-1 {appImage.append(AppImage(name: "Image \(i)", pic: "photo (\(i))"))}
    }
}
