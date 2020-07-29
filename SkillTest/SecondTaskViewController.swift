//
//  SecondTaskViewController.swift
//  SkillTest
//
//  Copyright © 2020 Gleb Stolyarchuk. All rights reserved.
//

import UIKit

class SecondTaskViewController: UIViewController {
    
    var images = MiniGallery()
    
    var scroll = UIScrollView()
    
    override func viewDidLoad() {
          super.viewDidLoad()
          view.backgroundColor = .systemBackground
          initScrollView()
          generateScreen()
      }
    
    func initScrollView() {
        scroll.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(scroll)
        
        scroll.frame.size = self.view.frame.size
  
        NSLayoutConstraint.activate([
            scroll.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            scroll.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            scroll.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            scroll.heightAnchor.constraint(equalTo: self.view.heightAnchor)
        ])
    }

    func generateScreen(){
        var xPoint = 0
        var yPoint = 0
        var width = Int(scroll.frame.width / 2)
        var height = Int(scroll.frame.width / 2)
        var pos = images.appImage.count

        
        func changePos(pos: Int){
            switch pos {
            case 0: do {
            xPoint += width }
            case 1: do {
            xPoint -= width
            yPoint += height
            scroll.contentSize.height += CGFloat(height) }
            default: print("WTF!")
            }
        }
        
        for el in images.appImage{
            var element = UIView()
            element.frame = (CGRect(x: xPoint, y: yPoint, width: width, height: height))
            scroll.addSubview(element)
            generateView(image: el, myview: element)
            changePos(pos: (pos)%2)
            pos -= 1
        }
    }
    
    func generateView(image: AppImage, myview: UIView) {
        let img = UIImageView()
        let lbl = UILabel()
        
        myview.clipsToBounds = true
              
              img.translatesAutoresizingMaskIntoConstraints = false
              img.contentMode = .scaleAspectFill
              img.image = UIImage(named: image.pic)
              img.clipsToBounds = true
            myview.addSubview(img)

              lbl.backgroundColor = .systemBackground
              lbl.text = image.name
              lbl.textColor = UIColor.black
              lbl.textAlignment = .center
              lbl.translatesAutoresizingMaskIntoConstraints = false
              myview.addSubview(lbl)
              
              NSLayoutConstraint.activate([
                  img.centerYAnchor.constraint(equalTo: myview.centerYAnchor),
                  img.centerXAnchor.constraint(equalTo: myview.centerXAnchor),
                  lbl.centerXAnchor.constraint(equalTo: myview.centerXAnchor),
                  lbl.bottomAnchor.constraint(equalTo: myview.bottomAnchor),
                  lbl.widthAnchor.constraint(equalTo: myview.widthAnchor),
                  lbl.heightAnchor.constraint(equalToConstant: 25)
              ])
    }
}
