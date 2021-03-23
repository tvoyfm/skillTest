//
//  Task.swift
//  SkillTest
//
//  Copyright © 2021 Gleb Stolyarchuk. All rights reserved.
//

import Foundation
import RealmSwift

class Task: Object {
    @objc dynamic var id    : Int = 0
    @objc dynamic var title : String = ""
    @objc dynamic var state : TaskState = .off

    convenience init (_ title : String) {
        self.init()
        self.title = title
        self.id = Settings.nextId
        
        Settings.nextId += 1
    }
}

