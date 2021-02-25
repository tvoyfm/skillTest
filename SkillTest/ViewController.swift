//
//  ViewController.swift
//  SkillTest
//
//  Copyright © 2020 Gleb Stolyarchuk. All rights reserved.
//

import UIKit
import Animatics

// ф-я присваивания в экземпляр tableView делегата: myController <* tableView, поле этого myController становится делегатом для tableView;
infix operator <*
func <* (left: UITableView, right: UITableViewDelegate) {
    left.delegate = right
}

class ViewController: UIViewController, UITableViewDelegate{
    
    var tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView <* self
    }
}
