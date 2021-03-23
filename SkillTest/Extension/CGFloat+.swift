//
//  CGFloat+.swift
//  ColorWallet
//
//  Copyright © 2020 Gleb Stolyarchuk. All rights reserved.
//

import UIKit

extension CGFloat {
    // return random CGFloat
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }

}
