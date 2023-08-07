//
//  SkillCollectionViewCell.swift
//  ResumeApp
//
//  Created by Victor Garitskyu on 06.08.2023.
//

import UIKit

// MARK: - UICollectionViewCell

class SkillCollectionViewCell: UICollectionViewCell {
    
    let skillLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    let deleteSkillIcon: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "del"), for: .normal)
        button.tintColor = .gray
        button.isHidden = true
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .systemGray6
        contentView.layer.cornerRadius = 12
        contentView.addSubview(skillLabel)
        contentView.addSubview(deleteSkillIcon)
        
        
        skillLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            // Устанавливаем отступы внутри ячейки
            skillLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: -8),
            skillLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            skillLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            skillLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            skillLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
        
        deleteSkillIcon.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            deleteSkillIcon.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            deleteSkillIcon.widthAnchor.constraint(equalToConstant: 18),
            deleteSkillIcon.heightAnchor.constraint(equalToConstant: 18),
            deleteSkillIcon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

            deleteSkillIcon.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
