//
//  Task5.swift
//  SkillTest
//
//  Created by Глеб Столярчук on 03/03/2021.
//  Copyright © 2021 Gleb Stolyarchuk. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class Task5: UIViewController {
    
// MARK: - Parameters
    let padding         : CGFloat = 15.0
    let objHeight       : CGFloat = 30
    let cornerRadius    : CGFloat = 5
    
// MARK: - Objects
    var label           = UILabel()
    let btn1            = UIButton(type: .roundedRect)
    let btn2            = UIButton(type: .roundedRect)
    let resetButton     = UIButton(type: .system)

    // RX
    let checker         = BehaviorRelay<(btn1Check: Bool, btn2Check: Bool)>(value: (false, false))
    var isValid         = BehaviorRelay(value: false)
    let disposeBag      = DisposeBag()
    
// MARK: - Config view
    func setupView() {
        view.backgroundColor = .systemBackground
        updateConstraints()
        configLabel()
        configButtons()
        configResetButton()
    }
    
// MARK: Config objects
    func configLabel() {
        checker
            .asObservable()
            .subscribe({_ in
                self.isValid.accept(self.checkerCheck())
            })
            .disposed(by: disposeBag)
        
        isValid
            .asObservable()
            .subscribe({ ok in
                if ok.element! {
                    self.label.text = "Ракета запущена"
                } else {
                    self.label.text = ""
                }
            })
            .disposed(by: disposeBag)
    }
    
    func configButtons() {
        btn1.setImage(UIImage.init(systemName: "airplane"), for: .normal)
        btn2.setImage(UIImage.init(systemName: "location"), for: .normal)

            btn1
                .rx
                .tap
                .bind(onNext: {_ in
                    self.checker.accept((true, self.checker.value.btn2Check) as (btn1Check: Bool, btn2Check: Bool))
                    print(self.checker.value)
                })
                .disposed(by: disposeBag)
            
            btn2
                .rx
                .tap
                .bind(onNext: {_ in
                    self.checker.accept((self.checker.value.btn1Check, true) as (btn1Check: Bool, btn2Check: Bool))
                    print(self.checker.value)
                })
                .disposed(by: disposeBag)
    }
    
    func configResetButton() {
        resetButton.setImage(.remove, for: .normal)
        
        resetButton
            .rx
            .tap
            .bind(onNext: {_ in
                self.checker.accept((false, false))
                self.isValid.accept(false)
                
                print("Reset variables: \(self.checker.value)")
            })
            .disposed(by: disposeBag)
    }
    
    func checkerCheck() -> Bool {
        let result = checker.value.btn1Check && checker.value.btn2Check
        return result
    }

    
// MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
// MARK: Update сonstraints
    func updateConstraints() {
        for v in [label, btn1, btn2, resetButton] {
            view.addSubview(v)
            v.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor),
            label.heightAnchor.constraint(equalToConstant: objHeight),
            
            btn1.topAnchor.constraint(equalTo: label.bottomAnchor, constant: padding),
            btn1.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            
            btn2.topAnchor.constraint(equalTo: btn1.bottomAnchor, constant: padding),
            btn2.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            
            resetButton.topAnchor.constraint(equalTo: btn2.bottomAnchor, constant: padding),
            resetButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor)
        ])
    }
}
