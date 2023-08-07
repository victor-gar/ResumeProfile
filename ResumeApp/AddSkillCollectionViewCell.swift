//
//  AddSkillCollectionViewCell.swift
//  ResumeApp
//
//  Created by Victor Garitskyu on 06.08.2023.
//

import UIKit

// MARK: - UICollectionViewCell

class AddSkillCollectionViewCell: UICollectionViewCell {
    
    let addSkillButton: UIButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        button.setTitleColor(.black, for: .normal)
//            button.backgroundColor = .gray
//            button.layer.cornerRadius = 12.0
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .systemGray6
        contentView.layer.cornerRadius = 12
        
        contentView.addSubview(addSkillButton)
        
        addSkillButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
           
            addSkillButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            addSkillButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)

            
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
