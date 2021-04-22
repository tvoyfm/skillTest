//
//  MainViewController.swift
//  SkillTest
//
//  Copyright © 2020 Gleb Stolyarchuk. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, MainViewProtocol {
    
// MARK: - Objects
    var presenter: MainPresenterProtocol!
    var configurator: MainConfiguratorProtocol = MainConfigurator()

// MARK: - Parameters
    let selfToChangeSegue = "MainToChangeSegue"
    
// MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.configureView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.updateView()
    }
    
// MARK: - Outlets
    @IBOutlet weak var numberLabel: UILabel!
    
// MARK: - Actions
    @IBAction func minusAction(_ sender: Any) {
        presenter.minusClicked()
    }
    
    @IBAction func manualAction(_ sender: Any) {
        presenter.manualClicked()
    }
    
    @IBAction func plusAction(_ sender: Any) {
        presenter.plusClicked()
    }
    
// MARK: - Presenter
    func setValue(value: Int) {
        numberLabel.text = String(value)
    }

}
