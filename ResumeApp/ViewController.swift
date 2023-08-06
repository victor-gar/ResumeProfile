//
//  ViewController.swift
//  ResumeApp
//
//  Created by Victor Garitskyu on 06.08.2023.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - UI Elements
    
    let colorView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        return view
    }()
    // Label с заголовком "Мой профиль"
    let profileLabel: UILabel = {
           let label = UILabel()
           label.text = "Мой профиль"
           label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
           label.textColor = .darkText
           label.textAlignment = .center
           return label
       }()
    
    // Картинка профиля
    let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "image")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 75
        return imageView
    }()
    
    // Label с заголовком "ФИО"
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Гарицкий Виктор\nВладимирович"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    // Label с заголовком профессии
    let jobsLabel: UILabel = {
        let label = UILabel()
        label.text = "Junior iOS-разработчик, опыт 1 год"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray
        label.textAlignment = .center
        return label
    }()
    
    // Stack с отображением локации
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
    

    
    
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayout()
    }
    
    func setupHierarchy() {
        view.backgroundColor = .white

        colorView.addSubview(profileLabel)
        colorView.addSubview(profileImage)
        colorView.addSubview(nameLabel)
        colorView.addSubview(jobsLabel)
        locationStackView.addArrangedSubview(locationIcon)
        locationStackView.addArrangedSubview(locationLabel)
        colorView.addSubview(locationStackView)
        view.addSubview(colorView)
    }
    
    //MARK: - Setups

    func setupLayout(){
    
        colorView.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    colorView.widthAnchor.constraint(equalTo: view.widthAnchor),
                    colorView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
                    colorView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
                ])
        
        profileLabel.translatesAutoresizingMaskIntoConstraints = false
               NSLayoutConstraint.activate([
                profileLabel.topAnchor.constraint(equalTo: colorView.topAnchor, constant:80),                profileLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                profileLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
               ])
        
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImage.topAnchor.constraint(equalTo: profileLabel.bottomAnchor, constant: 40),
            profileImage.widthAnchor.constraint(equalToConstant: 150),
            profileImage.heightAnchor.constraint(equalToConstant: 150)
                  ])
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
               NSLayoutConstraint.activate([
                nameLabel.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 20),
                nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
               ])
        
        jobsLabel.translatesAutoresizingMaskIntoConstraints = false
               NSLayoutConstraint.activate([
                jobsLabel.topAnchor.constraint(equalTo: locationStackView.topAnchor, constant: -20),
                jobsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                jobsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
               ])
        locationStackView.translatesAutoresizingMaskIntoConstraints = false
               NSLayoutConstraint.activate([
                locationStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                locationStackView.bottomAnchor.constraint(equalTo: colorView.bottomAnchor, constant: -15)
               ])
        
        locationIcon.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            locationIcon.widthAnchor.constraint(equalToConstant: 18),
            locationIcon.heightAnchor.constraint(equalToConstant: 18)
                  ])
    }
}

