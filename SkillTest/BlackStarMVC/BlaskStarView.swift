//
//  BlackStarView.swift
//  SkillTest
//
//  Created by Глеб Столярчук on 10/03/2021.
//  Copyright © 2021 Gleb Stolyarchuk. All rights reserved.
//

import UIKit

class BlackStarView: UIView {
    
// MARK: - Objects
    private let table: UITableView = UITableView(frame: .zero, style: .plain)
    
// MARK: - Init view
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
// MARK: - Setup UI
    func setupUI() {
    
    // MARK: Config functions
        func setupTable() {
            addSubview(table)
            table.translatesAutoresizingMaskIntoConstraints = false
            
            let constraints = [
                table.topAnchor.constraint      (equalTo: topAnchor),
                table.leadingAnchor.constraint  (equalTo: leadingAnchor),
                table.trailingAnchor.constraint (equalTo: trailingAnchor),
                table.bottomAnchor.constraint   (equalTo: bottomAnchor)]
            
            NSLayoutConstraint.activate(constraints)
        }
        
    // MARK: Call setup func
        setupTable()
    }
// MARK: Support func
    func reloadTable() {
        table.reloadData()
    }
    
    func registerCellForTable(cellClass: AnyClass?, identifier: String) {
        table.register(cellClass, forCellReuseIdentifier: identifier)
    }
    
    func setDataSourceTable(source: UITableViewDataSource) {
        table.dataSource = source
    }
    
}
