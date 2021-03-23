//
//  Settings.swift
//  SkillTest
//
//  Copyright © 2021 Gleb Stolyarchuk. All rights reserved.
//

import Foundation
final class Settings {
    private enum SettingsKeys: String {
        case nextId
    }
    
    static var nextId: Int! {
        get {
            return UserDefaults.standard.integer(forKey: SettingsKeys.nextId.rawValue)
        } set {
            let defaults = UserDefaults.standard
            let key = SettingsKeys.nextId.rawValue
            if let id = newValue {
                defaults.set(id, forKey: key)
            } else {
                defaults.removeObject(forKey: key)
            }
        }
    }
}
