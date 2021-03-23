//
//  ToggleView.swift
//  SkillTest
//
//  Copyright © 2021 Gleb Stolyarchuk. All rights reserved.
//

import UIKit

class ToggleView: UIView {
// MARK: - Parameters
    private let LEDsize:    CGFloat = 9.0
    private let toggleSize: CGFloat = 35.0
    
    var currentState: TaskState = .off {
        didSet {
            configLED()
        }
    }
    
// MARK: - Objects
    private let LED: UIView = UIView()
    
// MARK: - Config
    private func configLED() {
        switch currentState {
            case .on:   LED.backgroundColor = ToggleColors.action.value
            case .off:  LED.backgroundColor = ToggleColors.normal.value
        }
    }
    
// MARK: - Methods
    func swapState() {
        switch currentState {
            case .on:   self.currentState = .off
            case .off:  self.currentState = .on
        }
    }
    
// MARK: - Setup UI
    private func setupUI() {
        func setupView() {
            let constraints = [
                widthAnchor.constraint(equalToConstant: toggleSize),
                heightAnchor.constraint(equalToConstant: toggleSize)
            ]
            NSLayoutConstraint.activate(constraints)
        }
        
        func setupLED(){
            LED.layer.cornerRadius = LEDsize/2
            
            addSubview(LED)
            LED.translatesAutoresizingMaskIntoConstraints = false
            
            let constraints = [
                LED.centerYAnchor.constraint(equalTo: centerYAnchor),
                LED.centerXAnchor.constraint(equalTo: centerXAnchor),
                
                LED.widthAnchor.constraint(equalToConstant: LEDsize),
                LED.heightAnchor.constraint(equalToConstant: LEDsize)
            ]
            NSLayoutConstraint.activate(constraints)
        }
        
        // Call all methods
        setupView()
        setupLED()
    }
    
// MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configLED()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
