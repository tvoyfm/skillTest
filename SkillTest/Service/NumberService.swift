//
//  NumberService.swift
//  SkillTest
//
//  Copyright © 2021 Gleb Stolyarchuk. All rights reserved.
//

import Foundation

protocol NumberServiceProtocol {
    func currentValue() -> Int
    func changeValue(newValue: Int)
}

class NumberService: NumberServiceProtocol {
    let defaults = UserDefaults.standard
    let valueKey = "value"
    
    func currentValue() -> Int {
        let result = defaults.integer(forKey: valueKey)
        return result
    }
    
    func changeValue(newValue: Int) {
        defaults.set(newValue, forKey: valueKey)
    }
    
}
