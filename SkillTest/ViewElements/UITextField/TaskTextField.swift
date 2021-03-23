//
//  TaskTextField.swift
//  SkillTest
//
//  Copyright © 2021 Gleb Stolyarchuk. All rights reserved.
//

import UIKit

class TaskTextView: UIView {

// MARK: - Parameters
    private let cornerRadius:   CGFloat = 16.0
    private let LRpadding:      CGFloat = 8.0
    private let UDpadding:      CGFloat = 8.0
    private let textFont:       UIFont? = UIFont(name: "Montserrat-Regular", size: 16)
    
// MARK: - Objects
    let textView:       UITextView  = UITextView()
    let toggle:         ToggleView  = ToggleView()
    
    var currentTask:    Task? {
        didSet {
            textView.text = currentTask!.title
            toggle.currentState = currentTask!.state
        }
    }
    
// MARK: - Config
    func configView(){
        func configTextView() {
            textView.textColor = .white
            
            textView.backgroundColor = .clear
            
            textView.font = textFont
            textView.isScrollEnabled = false
        }
        // Call all methods
        configTextView()
    }
    
// MARK: - SetupUI
    func setupUI() {
        func setupView() {
            layer.cornerRadius = cornerRadius
            backgroundColor = TextViewColors.dark.value
            clipsToBounds = true
        }
        
        func setupToggle() {
            addSubview(toggle)
            toggle.translatesAutoresizingMaskIntoConstraints = false
            
            let constraints = [
                toggle.centerYAnchor.constraint(equalTo: centerYAnchor),
                toggle.rightAnchor.constraint(equalTo: rightAnchor)
            ]
            NSLayoutConstraint.activate(constraints)
        }
        
        func setupTextView() {
            addSubview(textView)
            textView.translatesAutoresizingMaskIntoConstraints = false
            
            let constraints = [
                textView.topAnchor.constraint(equalTo: topAnchor, constant: UDpadding),
                textView.leftAnchor.constraint(equalTo: leftAnchor, constant: LRpadding),
                textView.rightAnchor.constraint(equalTo: toggle.leftAnchor),
                textView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -UDpadding)
            ]
            NSLayoutConstraint.activate(constraints)

        }
        // Call all methods
        setupView()
        setupToggle()
        setupTextView()
    }

// MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configView()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
// MARK: - Update
    func update(task: Task) {
        currentTask = task
    }
}
