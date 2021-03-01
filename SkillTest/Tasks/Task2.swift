//
//  Task2.swift
//  SkillTest
//
//  Created by Глеб Столярчук on 01/03/2021.
//  Copyright © 2021 Gleb Stolyarchuk. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class Task2: UIViewController {
    
// MARK: - Parameters
    let padding          = CGFloat(15)
    let objHeight        = CGFloat(30)
    let cornerRadius     = CGFloat(5)
    
// MARK: - Objects
    let searchTextField  = UITextField()

    // RX
    let disposeBag = DisposeBag()
    
// MARK: - Config view
    func setupView() {
        view.backgroundColor = .systemBackground

        updateConstraints()
        configTextField()
    }
    
// MARK: Config objects
    
    func configTextField() {
        let format = DateFormatter()
        format.dateFormat = "HH:mm:SSS"
        
        searchTextField.placeholder  = "Введите поисковой запрос"
        
        searchTextField
            .rx
            .text
            .compactMap{ $0 }
            .observe(on: MainScheduler.asyncInstance)
            .throttle(RxTimeInterval.milliseconds(500), scheduler: MainScheduler.instance)
            .subscribe(onNext: { print("\(format.string(from: NSDate.now)) : Отправка запроса для \($0)")} )
            .disposed(by: disposeBag)
    }

    
// MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
// MARK: Update сonstraints
    func updateConstraints() {
        for v in [searchTextField] {
            view.addSubview(v)
            v.translatesAutoresizingMaskIntoConstraints = false
            v.layer.cornerRadius = cornerRadius
        }
        
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            searchTextField.topAnchor.constraint(equalTo: safeArea.centerYAnchor),
            searchTextField.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: padding),
            searchTextField.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -padding),
            searchTextField.heightAnchor.constraint(equalToConstant: objHeight)
        ])
    }
}
