//
//  ViewController.swift
//  ResumeApp
//
//  Created by Victor Garitskyu on 06.08.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var skills: [String] = ["VIPER", "Swift", "MVC", "MVVM", "AutoLayout", "Storyboard", "Xib", "CSS", "SwiftUI", "UIKit"]
    
     let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        return scrollView
    }()
    
     let contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .white
        return contentView
    }()
    
     let colorView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        return view
    }()
    
     let profileLabel: UILabel = {
        let label = UILabel()
        label.text = "Мой профиль"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .center
        label.textColor = .darkText
        return label
    }()
    
     let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "image")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 75
        return imageView
    }()
    
     let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Гарицкий Виктор\nВладимирович"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
        label.textColor = .black
        label.numberOfLines = 2
        return label
    }()
    
     let jobsLabel: UILabel = {
        let label = UILabel()
        label.text = "Junior iOS-разработчик, опыт 1 год"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textAlignment = .center
        label.textColor = .gray
        return label
    }()
    
     let locationIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "loc")
        imageView.tintColor = .gray
        return imageView
    }()
    
     let locationLabel: UILabel = {
        let label = UILabel()
        label.text = "Челябинск"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray
        return label
    }()
    
     let locationStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 4
        return stackView
    }()
    
     let skillsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5 // добавляем отступы между строками
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(SkillCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.register(AddSkillCollectionViewCell.self, forCellWithReuseIdentifier: "addCell")
        return collectionView
    }()
    
     let editSkillIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "edit")
        imageView.tintColor = .gray
        return imageView
    }()
    
     let skillLabel: UILabel = {
        let label = UILabel()
        label.text = "Мои навыки"
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()
    
     let skillStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        return stackView
    }()
    
     let infoTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "О себе"
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()
    
     let infoLabel: UILabel = {
        let label = UILabel()
        label.text = "Знания: ООП, ПОП, SOLID, DRY, Swift, UIKit, SwiftUI, CocoaPods, SDK, RxSwift, REST API, API Integration, Networking, SQLite, Core Data, UserDefaults, Firebase, Realm, URLSession, GCD, ARC, UnitTest, Core Location, HealthKit, умею верстать кодом красивый UI (AutoLayout, Storyboard, Xib, кодом, SnapKit), Lottie MVC, MVP, MVVM, Viper Realm, URLSession, GCD, ARC, UnitTest, Core Location, HealthKit, умею верстать кодом красивый UI (AutoLayout, Storyboard, Xib, кодом, SnapKit), Lottie MVC, MVP, MVVM, Viper Realm, URLSession, GCD, ARC, UnitTest, Core Location, HealthKit, умею верстать кодом красивый UI (AutoLayout, Storyboard, Xib, кодом, SnapKit), Lottie MVC, MVP, MVVM, Viper"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textAlignment = .left
        label.textColor = .darkText
        label.numberOfLines = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
        skillsCollectionView.delegate = self
        skillsCollectionView.dataSource = self
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)

        colorView.addSubview(profileLabel)
        colorView.addSubview(profileImage)
        colorView.addSubview(nameLabel)
        colorView.addSubview(jobsLabel)
        contentView.addSubview(colorView)
        locationStackView.addArrangedSubview(locationIcon)
        locationStackView.addArrangedSubview(locationLabel)
        colorView.addSubview(locationStackView)
        contentView.addSubview(skillsCollectionView)
        contentView.addSubview(infoTitleLabel)
        skillStackView.addArrangedSubview(skillLabel)
        skillStackView.addArrangedSubview(editSkillIcon)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(editSkills))
             editSkillIcon.addGestureRecognizer(tapGesture)
             editSkillIcon.isUserInteractionEnabled = true
        
        contentView.addSubview(infoLabel)
        contentView.addSubview(skillStackView)

    }
    
    private func setupConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        colorView.translatesAutoresizingMaskIntoConstraints = false
        profileLabel.translatesAutoresizingMaskIntoConstraints = false
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        jobsLabel.translatesAutoresizingMaskIntoConstraints = false
        locationStackView.translatesAutoresizingMaskIntoConstraints = false
        locationIcon.translatesAutoresizingMaskIntoConstraints = false
        skillsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        infoTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        skillStackView.translatesAutoresizingMaskIntoConstraints = false
        skillLabel.translatesAutoresizingMaskIntoConstraints = false
        editSkillIcon.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                
                contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
                
                colorView.topAnchor.constraint(equalTo: contentView.topAnchor),
                colorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                colorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                colorView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
                
                profileLabel.topAnchor.constraint(equalTo: colorView.topAnchor, constant: -30),
                profileLabel.leadingAnchor.constraint(equalTo: colorView.leadingAnchor, constant: 20),
                profileLabel.trailingAnchor.constraint(equalTo: colorView.trailingAnchor, constant: -20),
            profileLabel.bottomAnchor.constraint(equalTo: profileImage.topAnchor, constant: 20),

                profileImage.centerXAnchor.constraint(equalTo: colorView.centerXAnchor),
                profileImage.widthAnchor.constraint(equalToConstant: 150),
                profileImage.heightAnchor.constraint(equalToConstant: 150),
                
                nameLabel.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 20),
                nameLabel.leadingAnchor.constraint(equalTo: colorView.leadingAnchor, constant: 20),
                nameLabel.trailingAnchor.constraint(equalTo: colorView.trailingAnchor, constant: -20),
                
                jobsLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 15),
                jobsLabel.leadingAnchor.constraint(equalTo: colorView.leadingAnchor, constant: 20),
                jobsLabel.trailingAnchor.constraint(equalTo: colorView.trailingAnchor, constant: -20),
                
                locationStackView.centerXAnchor.constraint(equalTo: colorView.centerXAnchor),
                locationStackView.topAnchor.constraint(equalTo: jobsLabel.bottomAnchor, constant: 10),
                locationStackView.bottomAnchor.constraint(equalTo: colorView.bottomAnchor, constant: -20),
            
                locationIcon.widthAnchor.constraint(equalToConstant: 18),
                locationIcon.heightAnchor.constraint(equalToConstant: 18),
                
                skillsCollectionView.topAnchor.constraint(equalTo: skillStackView.bottomAnchor, constant: 15),
                skillsCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                skillsCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
                skillsCollectionView.heightAnchor.constraint(equalToConstant: 60),
                
                infoTitleLabel.topAnchor.constraint(equalTo: skillsCollectionView.bottomAnchor, constant: 15),
                infoTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                infoTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            skillLabel.topAnchor.constraint(equalTo: skillStackView.bottomAnchor, constant: 15),
            skillLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
                skillStackView.topAnchor.constraint(equalTo: colorView.bottomAnchor, constant: 10),
                skillStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                skillStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
                editSkillIcon.heightAnchor.constraint(equalToConstant: 18),
                locationStackView.heightAnchor.constraint(equalToConstant: 20),
                
                skillLabel.heightAnchor.constraint(equalToConstant: 22),
                infoLabel.topAnchor.constraint(equalTo: infoTitleLabel.bottomAnchor, constant: 15),
                infoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                infoLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
                infoLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
            ])
        }
    
    @objc func editSkills() {
      isEditing.toggle()
      skillsCollectionView.reloadData()
      if isEditing {
        editSkillIcon.image = UIImage(named: "save")
      } else {
        editSkillIcon.image = UIImage(named: "edit")
      }
    }
}



