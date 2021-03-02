//
//  Task3.swift
//  SkillTest
//
//  Created by Глеб Столярчук on 02/03/2021.
//  Copyright © 2021 Gleb Stolyarchuk. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class Task3: UIViewController {
    
// MARK: - Parameters
    let padding          = CGFloat(15)
    let objHeight        = CGFloat(30)
    let cornerRadius     = CGFloat(5)
    
// MARK: - Objects
    var table           = UITableView()
    let cellIdentifier  = "TableViewCell"
    
    let addButton       = UIButton(type: .system)
    let delButton       = UIButton(type: .system)

    // RX
    var namesForRandom = ["Sasha","Petya","Gleb","Nikita","Kostya",
                          "Olya","Katya","Alina","Polina","Jack",
                          "Kim","Kolya","Timur","Ron","Qard",
                          "Olesya","Nina","Foma","Ermak","Inga"]
    var names = BehaviorRelay(value: [""])
    let disposeBag = DisposeBag()
    
// MARK: - Config view
    func setupView() {
        view.backgroundColor = .systemBackground
        
        names.accept(namesForRandom)
        
        updateConstraints()
        configTableView()
        configAddButton()
        configDelButton()
    }
    
// MARK: Config objects
    
    func configTableView() {
        table.register(TableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        
        names
            .bind(to: table.rx.items) {
              (tableView: UITableView, index: Int, element: String) in
              let cell = TableViewCell()
                cell.nameLabel.text = element
              return cell
            }
            .disposed(by: disposeBag)
        }
    
    func configAddButton() {
        addButton.setImage(.add, for: .normal)
        
        addButton
        .rx
        .tap
        .bind(onNext: {
            self.names.accept(["\(self.namesForRandom.randomElement()!)"] + self.names.value)
        })
        .disposed(by: disposeBag)
    }
    
    func configDelButton() {
        delButton.setImage(.remove, for: .normal)

        delButton
        .rx
        .tap
        .bind(onNext: {
            var items = self.names.value
            
            if items.isEmpty {
                return
            } else {
                items.remove(at: items.endIndex - 1)
                self.names.accept(items)
            }
        })
        .disposed(by: disposeBag)
    }

    
// MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
// MARK: Update сonstraints
    func updateConstraints() {
        for v in [table, addButton, delButton] {
            view.addSubview(v)
            v.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            addButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            addButton.trailingAnchor.constraint(equalTo: safeArea.centerXAnchor, constant: -padding),
            
            delButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            delButton.leadingAnchor.constraint(equalTo: safeArea.centerXAnchor, constant: padding),
            
            table.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: padding),
            table.bottomAnchor.constraint(equalTo: addButton.topAnchor, constant: -padding),
            table.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: padding),
            table.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -padding),
        ])
    }
}
