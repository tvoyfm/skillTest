//
//  AddTaskButton.swift
//  SkillTest
//
//  Copyright © 2021 Gleb Stolyarchuk. All rights reserved.
//

import UIKit

class AddTaskButton: UIButton {

// MARK: - Parameters
    private let cornerRadius:   CGFloat = 16.0
    private let height:         CGFloat = 40.0
    private let textFont:       UIFont? = UIFont(name: "Montserrat-Regular", size: 16)
    
// MARK: - Config
    func configView(){
        func configLabel() {
            titleLabel?.font = textFont
            tintColor = .white
        }
        // Call all methods
        configLabel()
    }
    
// MARK: - SetupUI
    func setupUI() {
        func setupView() {
            layer.cornerRadius = cornerRadius
            backgroundColor = TextViewColors.dark.value
            clipsToBounds = true
        }
        
        // Call all methods
        setupView()
    }

// MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configView()
        setupUI()
    }
    
    convenience init(title: String) {
        self.init()
        setTitle(title, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
