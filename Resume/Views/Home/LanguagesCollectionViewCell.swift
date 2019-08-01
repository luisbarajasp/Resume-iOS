//
//  LanguagesCollectionViewCell.swift
//  Resume
//
//  Created by Luis Eduardo Barajas Perez on 8/1/19.
//  Copyright © 2019 Luis Barajas. All rights reserved.
//

import UIKit

class LanguagesCollectionViewCell: SectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var isFirstLoad = true
    
    var languages: [Language] = [] {
        didSet {
            if isFirstLoad {
                isFirstLoad = false
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                    
                    self.collectionView.layoutIfNeeded()
                }
            }
            
            
        }
    }
    
    let languagesTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        label.text = "Languages"
        label.sizeToFit()
        return label
    }()
    
    let cellId = "cellId"
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.showsHorizontalScrollIndicator = false
        cv.showsVerticalScrollIndicator = false
        cv.register(SkillsCollectionCell.self, forCellWithReuseIdentifier: cellId)
        cv.showsVerticalScrollIndicator = false
        cv.backgroundColor = .white
        cv.isPagingEnabled = false
        cv.sizeToFit()
        cv.isScrollEnabled = false
        cv.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        return cv
    }()
    
    let cellColors: [[UIColor]] = [[UIColor(red: 252, green: 131, blue: 123), UIColor(red: 252, green: 55, blue: 87)],
                                   [UIColor(red: 253, green: 151, blue: 55), UIColor(red: 248, green: 133, blue: 78)],
                                   [UIColor(red: 56, green: 209, blue: 120), UIColor(red: 51, green: 184, blue: 100)],
                                   [UIColor(red: 9, green: 168, blue: 224), UIColor(red: 34, green: 230, blue: 154)]]
    
    override func setUpViews() {
        contentView.addSubview(languagesTitleLabel)
        languagesTitleLabel.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: nil, trailing: contentView.trailingAnchor, padding: UIEdgeInsets(top: 10, left: 20, bottom: 0, right: 20))
        
        contentView.addSubview(collectionView)
        collectionView.anchor(top: languagesTitleLabel.bottomAnchor, leading: contentView.leadingAnchor, bottom: nil, trailing: contentView.trailingAnchor, padding: UIEdgeInsets(top: 10, left: 15, bottom: 0, right: 15), size: CGSize(width: 0, height: 120))
        
        contentView.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor).isActive = true
    }
    
    // MARK: - Collection View Methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return languages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SkillsCollectionCell
        
        cell.skill = "\(String(describing: languages[indexPath.row].name!)): \(String(describing: languages[indexPath.row].level!))"
        
        cell.colors = cellColors[indexPath.row]
        
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width / 2 - 10, height: 30)
    }
}

