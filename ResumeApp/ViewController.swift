//
//  ViewController.swift
//  ResumeApp
//
//  Created by Victor Garitskyu on 06.08.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var skills: [String] = ["VIPER", "Swift", "MVC", "MVVM", "AutoLayout", "Storyboard", "Xib", "CSS", "SwiftUI", "UIKit"]
    
    var collectionViewHeight: CGFloat = 0 // <- Объявляем здесь

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.frame = self.view.bounds
        scrollView.contentSize = contentSize
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .white
        contentView.frame.size = contentSize
        return contentView
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 20
        return stackView
    }()
    
    private var contentSize: CGSize {
        CGSize(width: view.frame.width, height: view.frame.height + 400)
    }
    
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
    
 
    
    // UICollectionView для тэгов навыков
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

    // Stack навыков
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
        label.textColor = .black
        return label
    }()
    let infoLabel: UILabel = {
           let label = UILabel()
           label.text = "Знания: ООП, ПОП, SOLID, DRY, Swift, UIKit, SwiftUI, CocoaPods, SDK, RxSwift, REST API, API Integration, Networking, SQLite, Core Data, UserDefaults, Firebase, Realm, URLSession, GCD, ARC, UnitTest, Core Location, HealthKit, умею верстать кодом красивый UI (AutoLayout, Storyboard, Xib, кодом, SnapKit), Lottie MVC, MVP, MVVM, Viper"
           label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
           label.textColor = .darkText
           label.textAlignment = .left
           label.numberOfLines = 0
           return label
       }()
        
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayout()
    }
    

    
    func setupHierarchy() {
        view.backgroundColor = .white
        view.addSubview(scrollView)
       
        scrollView.addSubview(contentView)
        contentView.addSubview(stackView)
        
        skillStackView.addArrangedSubview(skillLabel)
        skillStackView.addArrangedSubview(editSkillIcon)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(editSkills))
        editSkillIcon.addGestureRecognizer(tapGesture)
        editSkillIcon.isUserInteractionEnabled = true
        
        stackView.addSubview(skillsCollectionView)
        contentView.addSubview(infoTitleLabel)
        contentView.addSubview(skillStackView)
        contentView.addSubview(infoLabel)

        view.addSubview(colorView)
        colorView.addSubview(profileLabel)
        colorView.addSubview(profileImage)
        colorView.addSubview(nameLabel)
        colorView.addSubview(jobsLabel)
        locationStackView.addArrangedSubview(locationIcon)
        locationStackView.addArrangedSubview(locationLabel)
        colorView.addSubview(locationStackView)
        
        

    }
    
    //MARK: - Setups

    func setupLayout(){
    
        colorView.translatesAutoresizingMaskIntoConstraints = false
                    NSLayoutConstraint.activate([
                        colorView.widthAnchor.constraint(equalTo: view.widthAnchor),
                        colorView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
                        colorView.topAnchor.constraint(equalTo: view.topAnchor),
                        colorView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
                    ])
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
                    NSLayoutConstraint.activate([
                        scrollView.topAnchor.constraint(equalTo: colorView.bottomAnchor),
                        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                    ])
        
        let heightConstraint = contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
            heightConstraint.priority = UILayoutPriority(250)
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
                    NSLayoutConstraint.activate([
                        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                        contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                        contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
                        heightConstraint,
                      ])
       
        
  
        
        skillStackView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                skillStackView.topAnchor.constraint(equalTo: colorView.bottomAnchor, constant: 30),
                skillStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                skillStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                locationStackView.heightAnchor.constraint(equalToConstant: 20)
            ])
        
               

        skillsCollectionView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                skillsCollectionView.topAnchor.constraint(equalTo: skillStackView.bottomAnchor, constant:15),
                skillsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                skillsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                skillsCollectionView.heightAnchor.constraint(equalToConstant: 140)
            ])
        
        infoTitleLabel.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                infoTitleLabel.topAnchor.constraint(equalTo: skillsCollectionView.bottomAnchor, constant:15),
                infoTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                infoTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            ])
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                infoLabel.topAnchor.constraint(equalTo: infoTitleLabel.bottomAnchor, constant:15),
                infoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                infoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            ])
        profileLabel.translatesAutoresizingMaskIntoConstraints = false
               NSLayoutConstraint.activate([
                profileLabel.topAnchor.constraint(equalTo: colorView.topAnchor, constant:80),
                profileLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
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
        
        skillsCollectionView.delegate = self
        skillsCollectionView.dataSource = self
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



// MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return isEditing ? skills.count + 1 : skills.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if isEditing && indexPath.row == skills.count {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "addCell", for: indexPath) as! AddSkillCollectionViewCell
            cell.addSkillButton.addTarget(self, action: #selector(addSkill), for: .touchUpInside)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SkillCollectionViewCell
            cell.skillLabel.text = skills[indexPath.row]
            
            if isEditing {
                cell.deleteSkillIcon.isHidden = false
                cell.deleteSkillIcon.addTarget(self, action: #selector(deleteSkill(sender:)), for: .touchUpInside)
            } else {
                cell.deleteSkillIcon.isHidden = true
            }
            
            return cell
        }
        
    }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            if isEditing && indexPath.row == skills.count {
                return CGSize(width: 60, height: 30)
            } else {
                let fontAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17)]
                let skillName = skills[indexPath.row]
                let skillNameWidth = (skillName as NSString).size(withAttributes: fontAttributes).width
                return CGSize(width: skillNameWidth + 30, height: 30)
            }
            
        }
        
        @objc func deleteSkill(sender: UIButton) {
            if let cell = sender.superview?.superview as? SkillCollectionViewCell,
               let index = skillsCollectionView.indexPath(for: cell)?.row {
                skills.remove(at: index)
                skillsCollectionView.reloadData()
            }
        }
    
    @objc func addSkill() {
      // создаем UIAlertController с полем ввода
      let alert = UIAlertController(title: "Добавление навыка", message: "Введите название навыка которым вы владеете", preferredStyle: .alert)
      alert.addTextField()

      // создаем действия для UIAlertController
      let addAction = UIAlertAction(title: "Добавить", style: .default) { [weak self] _ in
        guard let skillName = alert.textFields?.first?.text else { return }
        self?.skills.append(skillName)
        self?.skillsCollectionView.reloadData()
      }

      let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)

      // добавляем действия в UIAlertController
      alert.addAction(addAction)
      alert.addAction(cancelAction)

      // показываем UIAlertController
      present(alert, animated: true, completion: nil)
    }
    

    }
    

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





