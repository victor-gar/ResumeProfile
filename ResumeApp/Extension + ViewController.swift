//
//  Extension + ViewController.swift
//  ResumeApp
//
//  Created by Victor Garitskyu on 06.08.2023.
//

import UIKit

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
