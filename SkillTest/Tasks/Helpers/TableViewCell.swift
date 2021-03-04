//
//  TableViewCell.swift
//  SkillTest
//
//  Created by Глеб Столярчук on 02/03/2021.
//  Copyright © 2021 Gleb Stolyarchuk. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    let nameLabel   = UILabel()
    
    let padding     = CGFloat(5)
    let sizeColor   = CGFloat(10)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configNameLabel()
        configConstraints()
    }
    
    func configNameLabel() {
        
    }
    
    func configConstraints() {
        for v in [nameLabel] {
            addSubview(v)
            v.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init is fall")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
