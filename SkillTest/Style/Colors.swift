//
//  Colors.swift
//  SkillTest
//
//  Copyright © 2021 Gleb Stolyarchuk. All rights reserved.
//

import UIKit

// MARK: - Toggle colors
enum ToggleColors {
    case normal
    case action
}

extension ToggleColors {
    var value: UIColor {
        get {
            switch self {
            case .normal:
                return UIColor.init(hexString: "798188")
            case .action:
                return UIColor.init(hexString: "70FF00")
            }
        }
    }
}

// MARK: - Background colors
enum BackgroundColors {
    case light
    case dark
}

extension BackgroundColors {
    var value: UIColor {
        get {
            switch self {
            case .light:
                return UIColor.init(hexString: "E3EDF7")
            case .dark:
                return UIColor.init(hexString: "1E2024")
            }
        }
    }
}

// MARK: - Background colors
enum TextViewColors {
    case light
    case dark
}

extension TextViewColors {
    var value: UIColor {
        get {
            switch self {
            case .light:
                return UIColor.init(hexString: "E3EDF7")
            case .dark:
                return UIColor.init(hexString: "2C333A")
            }
        }
    }
}
