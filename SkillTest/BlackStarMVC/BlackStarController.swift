//
//  ViewController.swift
//  SkillTest
//
//  Copyright © 2020 Gleb Stolyarchuk. All rights reserved.
//

import UIKit

class BlackStarController: UIViewController {
// MARK: - Parameters
    var cellIdentifier: String = "BlackStarCell"
    
// MARK: - Objects
    var categories: [Category] = []
    
// MARK: - Model
    let blackStarModel: BlackStarModel  = BlackStarModel()
    
// MARK: - View
    let blackStarView: BlackStarView    = BlackStarView()
    
// MARK: - View did functions
    override func viewDidLoad() {
        super.viewDidLoad()
        configTable()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        blackStarModel.loadCategories(completion: { categories in
            self.categories = categories
            self.blackStarView.reloadTable()
        })
    }

// MARK: - Config
    func configTable() {
        blackStarView.setDataSourceTable(source: self)
        blackStarView.registerCellForTable(cellClass: BlackStarCell.self, identifier: cellIdentifier)
    }

// MARK: - Setup UI
    func setupUI() {
        let safeArea = view.safeAreaLayoutGuide

    // MARK: Config functions
        func setupBlackStarView() {
                view.addSubview(blackStarView)
                blackStarView.translatesAutoresizingMaskIntoConstraints = false
                
                let constraints = [
                    blackStarView.topAnchor.constraint      (equalTo: safeArea.topAnchor),
                    blackStarView.leadingAnchor.constraint  (equalTo: safeArea.leadingAnchor),
                    blackStarView.trailingAnchor.constraint (equalTo: safeArea.trailingAnchor),
                    blackStarView.bottomAnchor.constraint   (equalTo: safeArea.bottomAnchor)]
                    
                NSLayoutConstraint.activate(constraints)
            }
        
    // MARK: Call setup func
        setupBlackStarView()
    }
}

// MARK: - Table Data Source
extension BlackStarController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! BlackStarCell
            let category = categories[indexPath.row]
            cell.configView(category: category)
        return cell
    }
}
