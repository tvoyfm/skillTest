//
//  TaskState.swift
//  SkillTest
//
//  Copyright © 2021 Gleb Stolyarchuk. All rights reserved.
//

import Foundation
import RealmSwift

@objc enum TaskState: Int, RealmEnum {
    case off = 0
    case on  = 1
    
    public var desc: String {
    switch self {
        case .on:
            return "Выполнена"
        case .off:
            return "Не выполнена"
        }
    }
    
}

