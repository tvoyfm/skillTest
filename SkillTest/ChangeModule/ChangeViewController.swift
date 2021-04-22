//
//  ChangeViewController.swift
//  SkillTest
//
//  Copyright © 2021 Gleb Stolyarchuk. All rights reserved.
//

import Foundation
import UIKit

class ChangeViewController: UIViewController, ChangeViewProtocol {
    
// MARK: - Objects
    var presenter: ChangePresenterProtocol!
    var configurator: ChangeConfiguratorProtocol = ChangeConfigurator()

// MARK: - Parameters
    let selfToChangeSegue = "MainToChangeSegue"
    var currentState = ChangeViewState.manual {
        didSet {
            switch currentState {
            case .manual: numberTextField.isHidden = false
            case .minus: numberTextField.isHidden = true
            case .plus: numberTextField.isHidden = true
            }
        }
    }
    
// MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.configureView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.updateView()
    }
    
// MARK: - Outlets
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var numberTextField: UITextField!
    
// MARK: - Actions
    @IBAction func changeAction(_ sender: Any) {
        let newValue = (numberTextField.text! as NSString).integerValue
        presenter.setValue(newValue: newValue)
    }
    
// MARK: - Presenter
    func setValue(value: Int) {
        numberLabel.text = String(value)
    }
    
// MARK: - Rout from main view
    func setPlusView() {
        currentState = .plus
    }
    
    func setMinusView() {
        currentState = .minus
    }
    
    func setManualView() {
        currentState = .manual
    }

}
