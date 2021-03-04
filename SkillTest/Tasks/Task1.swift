//
//  Task1.swift
//  SkillTest
//
//  Created by Глеб Столярчук on 28/02/2021.
//  Copyright © 2021 Gleb Stolyarchuk. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class Task1: UIViewController {
    
// MARK: - Parameters
    let padding          = CGFloat(15)
    let objHeight        = CGFloat(25)
    let cornerRadius     = CGFloat(5)
    
    let correctMail      = "test@test.com"
    let correctPassCount = 6
    
// MARK: - Objects
    let loginTextField  = UITextField()
    let passTextField   = UITextField()
    let resultLabel     = UILabel()
    let sendButton      = UIButton(type: .roundedRect)
    
    // RX
    let disposeBag = DisposeBag()
    
// MARK: - Config view
    func setupView() {
        view.backgroundColor = .systemBackground
        
        configSendButton()
        configTextFields()
        configResultLabel()
        updateConstraints()
    }
    
// MARK: Config objects
    func configSendButton() {
        sendButton.setTitle("Send", for: .normal)
        sendButton.isEnabled = false
        
        sendButton
            .rx
            .tap
            .bind {
                print("Процесс авторизации")
            }
            .disposed(by: disposeBag)
    }
    
    func configTextFields() {
        loginTextField.placeholder  = "Введите логин"
        passTextField.placeholder   = "Введите пароль"
        
        let username = loginTextField.rx.text.orEmpty.asObservable()
        let password = passTextField.rx.text.orEmpty.asObservable()

        confirmButtonValid(username: username, password: password)
            .bind(to: sendButton.rx.isEnabled)
            .disposed(by: disposeBag)
    }
    
    func configResultLabel() {
        resultLabel.textColor = .systemRed
        resultLabel.textAlignment = .center
    }
    
// MARK: - Logic
    func confirmButtonValid(username: Observable<String>, password: Observable<String>) -> Observable<Bool> {

        return Observable.combineLatest(username, password)
        { (username, password) in
            
            if password.count < self.correctPassCount {
                self.resultLabel.text = "Пароль должен быть больше \(self.correctPassCount) символов" }
            else if username != self.correctMail {
                self.resultLabel.text = "Некорректный e-mail" }
            else {
                self.resultLabel.text = ""
            }
            
            return username == self.correctMail
            && password.count > self.correctPassCount
        }
    }

    
// MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
// MARK: Update сonstraints
    func updateConstraints() {
        for v in [loginTextField, passTextField, resultLabel, sendButton] {
            view.addSubview(v)
            v.translatesAutoresizingMaskIntoConstraints = false
            v.layer.cornerRadius = cornerRadius
        }
        
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            loginTextField.topAnchor.constraint(equalTo: safeArea.centerYAnchor),
            loginTextField.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: padding),
            loginTextField.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -padding),
            loginTextField.heightAnchor.constraint(equalToConstant: objHeight),
            
            passTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: padding),
            passTextField.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: padding),
            passTextField.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -padding),
            passTextField.heightAnchor.constraint(equalToConstant: objHeight),
            
            resultLabel.topAnchor.constraint(equalTo: passTextField.bottomAnchor, constant: padding),
            resultLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: padding),
            resultLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -padding),
            resultLabel.heightAnchor.constraint(equalToConstant: objHeight),
            
            sendButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -padding),
            sendButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            sendButton.heightAnchor.constraint(equalToConstant: objHeight)
        ])
    }
}
