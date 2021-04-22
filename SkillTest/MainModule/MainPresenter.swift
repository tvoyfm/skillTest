//
//  MainPresenter.swift
//  SkillTest
//
//  Copyright © 2021 Gleb Stolyarchuk. All rights reserved.
//

import Foundation

class MainPresenter: MainPresenterProtocol {
    
// MARK: Objects
    weak var view: MainViewProtocol!
    var router: MainRouterProtocol!
    var interactor: MainInteractorProtocol!
  
    required init(view: MainViewProtocol) {
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
    func plusClicked() {
        router.showPlusView()
    }
    
    func minusClicked() {
        router.showMinusView()
    }
    
    func manualClicked() {
        router.showManualView()
    }
    
}
