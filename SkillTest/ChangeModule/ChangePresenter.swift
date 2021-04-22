//
//  ChangePresenter.swift
//  SkillTest
//
//  Copyright © 2021 Gleb Stolyarchuk. All rights reserved.
//

import Foundation

class ChangePresenter: ChangePresenterProtocol {
    
// MARK: Objects
    weak var view: ChangeViewProtocol!
    var router: ChangeRouterProtocol!
    var interactor: ChangeInteractorProtocol!
  
    required init(view: ChangeViewProtocol) {
        self.view = view
    }
    
    var value: Int {
        return interactor!.value
    }
    
    func updateView() {
        view.setValue(value: value)
    }
    
    func configureView() {
        updateView()
    }
    
// MARK: - Action functions
    func setValue(newValue: Int) {
        interactor.setValue(newValue: newValue, state: view.currentState)
        updateView()
        router.closeView()
    }
    
}
