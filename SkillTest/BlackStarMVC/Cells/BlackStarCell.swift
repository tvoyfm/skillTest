//
//  BlackStarCell.swift
//  SkillTest
//
//  Created by Глеб Столярчук on 11/03/2021.
//  Copyright © 2021 Gleb Stolyarchuk. All rights reserved.
//

import UIKit

class BlackStarCell: UITableViewCell {
    
// MARK: - Parameters
    private let LRPadding:      CGFloat = 10.0
    private let UDPadding:      CGFloat = 10.0
    private let height:         CGFloat = 80.0
    private let cornerRadius:   CGFloat = 25.0
    
    private let borderWidth:    CGFloat = 1.0
    private let borderColor:    CGColor = UIColor.darkGray.cgColor
    
// MARK: - Objects
    private let nameLabel       = UILabel()
    private let imageCategory   = UIImageView()
    
// MARK: - Config
    func configView(category: Category){
        func configLabel(category: Category) {
            nameLabel.text = category.name
        }
        
        func configImageView(category: Category) {
            imageCategory.layer.cornerRadius = cornerRadius
            imageCategory.backgroundColor = .white
            imageCategory.contentMode = .scaleAspectFit
            imageCategory.clipsToBounds = true
            imageCategory.layer.borderWidth = borderWidth
            imageCategory.layer.borderColor = borderColor

            (category.imageURL != nil) ? imageCategory.load(url: category.imageURL!) : print("empty url")
        }
        
        // MARK: Call all config methods
        configLabel(category: category)
        configImageView(category: category)
    }
    
// MARK: - Setup UI
    private func setupUI() {
        
        func setupLabel() {
            addSubview(nameLabel)
            nameLabel.translatesAutoresizingMaskIntoConstraints = false
            
            let constraints = [
                nameLabel.topAnchor.constraint(equalTo: topAnchor),
                nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
                nameLabel.leadingAnchor.constraint(equalTo: imageCategory.trailingAnchor, constant: LRPadding)
            ]
            
            NSLayoutConstraint.activate(constraints)
        }
        
        func setupImage() {
            addSubview(imageCategory)
            imageCategory.translatesAutoresizingMaskIntoConstraints = false
            
            let constraints = [
                imageCategory.heightAnchor.constraint(equalToConstant: height),
                imageCategory.widthAnchor.constraint(equalTo: imageCategory.heightAnchor),
                imageCategory.topAnchor.constraint(equalTo: topAnchor, constant: UDPadding),
                imageCategory.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -UDPadding),
                imageCategory.leadingAnchor.constraint(equalTo: leadingAnchor, constant: LRPadding)
            ]
            NSLayoutConstraint.activate(constraints)
        }
        
        // MARK: Call all setup methods
        setupImage()
        setupLabel()
        
    }
    
// MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
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
