//
//  TaskView.swift
//  SkillTest
//
//  Copyright © 2021 Gleb Stolyarchuk. All rights reserved.
//

import UIKit

class TaskView: UIView {
// MARK: - Parameters
    private let UDpadding:      CGFloat = 8.0
    private let cornerRadius:   CGFloat = 16.0
    private let buttonHeight:   CGFloat = 50.0
    
// MARK: - Objects
    let addBtn: AddTaskButton   = AddTaskButton(title: "Добавить задачу")
    let table:  UITableView     = UITableView()
    
// MARK: - Config
    private func configView() {
        func configTable()  {
            table.layer.cornerRadius = cornerRadius
        }
        
        // Call all methods
        configTable()
    }
    
// MARK: - Setup UI
    private func setupUI() {
        func setupButton() {
            addSubview(addBtn)
            addBtn.translatesAutoresizingMaskIntoConstraints = false
            
            let constraints = [
                addBtn.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -UDpadding),
                addBtn.leftAnchor.constraint(equalTo: leftAnchor),
                addBtn.rightAnchor.constraint(equalTo: rightAnchor),
                addBtn.heightAnchor.constraint(equalToConstant: buttonHeight)
            ]
            NSLayoutConstraint.activate(constraints)
        }
        
        func setupTable() {
            addSubview(table)
            table.translatesAutoresizingMaskIntoConstraints = false
            
            let constraints = [
                table.topAnchor.constraint(equalTo: topAnchor),
                table.bottomAnchor.constraint(equalTo: addBtn.topAnchor, constant: -UDpadding),
                table.leftAnchor.constraint(equalTo: leftAnchor),
                table.rightAnchor.constraint(equalTo: rightAnchor)
            ]
            NSLayoutConstraint.activate(constraints)
        }
        
        // Call all methods
        setupButton()
        setupTable()
    }

// MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configView()
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
// MARK: - Support table func
    func reloadTable() {
        table.reloadData()
    }
    
    func registerCellForTable(cellClass: AnyClass?, identifier: String) {
        table.register(cellClass, forCellReuseIdentifier: identifier)
    }
    
    func setDataSourceTable(source: UITableViewDataSource) {
        table.dataSource = source
    }
    
    func setClearBackground() {
        table.backgroundColor = .clear
        table.separatorStyle = .none
        table.separatorColor = .clear
    }
    
    func setTargetButton(target: Any, selector: Selector) {
        addBtn.addTarget(target, action: selector, for: .touchUpInside)
    }
    
}

// MARK: - TaskTableViewCellProtocol
extension TaskView: TaskTableViewCellProtocol {
    func updateHeightOfRow(_ cell: TaskTableViewCell, _ textView: UITextView) {
        let size = textView.bounds.size
        let newSize = table.sizeThatFits(CGSize(width: size.width,
                                                        height: CGFloat.greatestFiniteMagnitude))
        if size.height != newSize.height {
            UIView.setAnimationsEnabled(false)
            table.beginUpdates()
            table.endUpdates()
            
            UIView.setAnimationsEnabled(true)
            if let thisIndexPath = table.indexPath(for: cell) {
                table.scrollToRow(at: thisIndexPath, at: .bottom, animated: false)
            }
        }
    }
}
