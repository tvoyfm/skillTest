//
//  MainProtocols.swift
//  SkillTest
//
//  Copyright © 2021 Gleb Stolyarchuk. All rights reserved.
//

import Foundation
import UIKit

protocol MainViewProtocol: class {
    func setValue(value: Int)
}

protocol MainPresenterProtocol: class {
    func configureView()
    func updateView()
    
    func plusClicked()
    func manualClicked()
    func minusClicked()
}

protocol MainInteractorProtocol {
    var value: Int { get set }
}

protocol MainRouterProtocol {
    func showPlusView()
    func showMinusView()
    func showManualView()
}

protocol MainConfiguratorProtocol: class {
    func configure(with viewController: MainViewController)
}
