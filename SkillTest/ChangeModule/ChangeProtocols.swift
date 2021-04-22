//
//  ChangeProtocols.swift
//  SkillTest
//
//  Copyright © 2021 Gleb Stolyarchuk. All rights reserved.
//

import Foundation
import UIKit

protocol ChangeViewProtocol: class {
    var currentState: ChangeViewState { get }
    func setValue(value: Int)
    
    func setPlusView()
    func setMinusView()
    func setManualView()
}

protocol ChangePresenterProtocol: class {
    func configureView()
    func updateView()
    func setValue(newValue: Int)
}

protocol ChangeInteractorProtocol {
    var value: Int { get }
    func setValue(newValue: Int, state: ChangeViewState)
}

protocol ChangeRouterProtocol {
    func closeView()
}

protocol ChangeConfiguratorProtocol: class {
    func configure(with viewController: ChangeViewController)
}
