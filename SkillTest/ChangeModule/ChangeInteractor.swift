//
//  ChangeInteractor.swift
//  SkillTest
//
//  Copyright © 2021 Gleb Stolyarchuk. All rights reserved.
//

import Foundation

class ChangeInteractor: ChangeInteractorProtocol {
    var numberService: NumberServiceProtocol = NumberService()
    
    weak var presenter: ChangePresenterProtocol!
        
    required init(presenter: ChangePresenterProtocol) {
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
    
    func setValue(newValue: Int, state: ChangeViewState) {
        switch state {
            case .manual:   value = newValue
            case .plus:     value += 1
            case .minus:    value -= 1
        }
    }
    
}
