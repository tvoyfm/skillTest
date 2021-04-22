//
//  ChangeRouter.swift
//  SkillTest
//
//  Copyright © 2021 Gleb Stolyarchuk. All rights reserved.
//

import Foundation
import UIKit

class ChangeRouter: ChangeRouterProtocol {

    weak var viewController: ChangeViewController!
    
    init(viewController: ChangeViewController) {
        self.viewController = viewController
    }
    
    func closeView() {
        viewController.navigationController?.popViewController(animated: true)
        viewController.dismiss(animated: true, completion: nil)
    }
}
