//
//  MainInteractor.swift
//  SkillTest
//
//  Copyright © 2021 Gleb Stolyarchuk. All rights reserved.
//

import Foundation

class MainInteractor: MainInteractorProtocol {
    
    var numberService: NumberServiceProtocol = NumberService()
    
    weak var presenter: MainPresenterProtocol!
        
    required init(presenter: MainPresenterProtocol) {
        self.presenter = presenter
    }
    
    var value: Int {
        set {
            numberService.changeValue(newValue: newValue)
        }
        get {
            return numberService.currentValue()
        }
    }
    
}
