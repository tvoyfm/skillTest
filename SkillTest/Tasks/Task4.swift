//
//  Task4.swift
//  SkillTest
//
//  Created by Глеб Столярчук on 03/03/2021.
//  Copyright © 2021 Gleb Stolyarchuk. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class Task4: UIViewController {
    
// MARK: - Parameters
    let padding         : CGFloat = 15.0
    let objHeight       : CGFloat = 30
    let cornerRadius    : CGFloat = 5
    
// MARK: - Objects
    var label           = UILabel()
    let addButton       = UIButton(type: .system)
    let resetButton     = UIButton(type: .system)

    // RX
    let counter         = BehaviorRelay(value: 0)
    let disposeBag      = DisposeBag()
    
// MARK: - Config view
    func setupView() {
        view.backgroundColor = .systemBackground
        updateConstraints()
        configLabel()
        configAddButton()
        configResetButton()
    }
    
// MARK: Config objects
    func configLabel() {
        counter
            .asObservable()
            .map { int -> String? in
                return Optional("\(int)")
            }
            .bind(to: self.label.rx.text)
            .disposed(by: disposeBag)
    }
    
    func configAddButton() {
        addButton.setImage(.add, for: .normal)
        
        addButton
            .rx
            .tap
            .bind(onNext: {
                self.counter.accept( self.counter.value + 1)
            })
            .disposed(by: disposeBag)
    }
    
    func configResetButton() {
        resetButton.setImage(.remove, for: .normal)
        
        resetButton
            .rx
            .tap
            .bind(onNext: {
                self.counter.accept(0)
            })
            .disposed(by: disposeBag)
    }

    
// MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
// MARK: Update сonstraints
    func updateConstraints() {
        for v in [label, addButton, resetButton] {
            view.addSubview(v)
            v.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor),
            label.heightAnchor.constraint(equalToConstant: objHeight),
            
            addButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: padding),
            addButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            
            resetButton.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: padding),
            resetButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor)
        ])
    }
}
