//
//  NSDate+.swift
//  ColorWallet
//
//  Copyright © 2020 Gleb Stolyarchuk. All rights reserved.
//

import Foundation

extension NSDate {
    func add(days: Int) -> Date {
        return Calendar(identifier: .gregorian).date(byAdding: .day, value: days, to: self as Date)!
    }
}
