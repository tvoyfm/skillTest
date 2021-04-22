//
//  MainRouter.swift
//  SkillTest
//
//  Copyright © 2021 Gleb Stolyarchuk. All rights reserved.
//

import Foundation
import UIKit

class MainRouter: MainRouterProtocol {

    weak var viewController: MainViewController!
    
    var changeVC: ChangeViewController!
    let changeVCIdentifier = "ChangeViewController"
    
    init(viewController: MainViewController) {
        self.viewController = viewController
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        changeVC = storyBoard.instantiateViewController(withIdentifier: changeVCIdentifier) as? ChangeViewController
        changeVC.modalPresentationStyle = .fullScreen
    }
    
    func showPlusView() {
        viewController.present(changeVC, animated:true, completion:nil)
        changeVC.setPlusView()
    }
    
    func showMinusView() {
        viewController.present(changeVC, animated:true, completion:nil)
        changeVC.setMinusView()
    }
    
    func showManualView() {
        viewController.present(changeVC, animated:true, completion:nil)
        changeVC.setManualView()
    }
}
