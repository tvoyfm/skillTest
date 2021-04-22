//
//  ChangeConfigurator.swift
//  SkillTest
//
//  Copyright © 2021 Gleb Stolyarchuk. All rights reserved.
//

import Foundation

class ChangeConfigurator: ChangeConfiguratorProtocol {
    
    func configure(with viewController: ChangeViewController) {
        let presenter = ChangePresenter(view: viewController)
        let interactor = ChangeInteractor(presenter: presenter)
        let router = ChangeRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
    
}
