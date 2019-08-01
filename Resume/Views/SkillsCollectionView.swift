//
//  SkillsCollectionView.swift
//  Resume
//
//  Created by Luis Eduardo Barajas Perez on 7/30/19.
//  Copyright © 2019 Luis Barajas. All rights reserved.
//

import UIKit

class SkillsCollectionView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var skills: [Skill] = [] {
        didSet {
            collectionView.reloadData()
            
            if let superView = self.superview as? ContentView {
                let height = collectionView.collectionViewLayout.collectionViewContentSize.height
                
                superView.skillsHeightConstraint.constant = height
                superView.setNeedsLayout()
                
            }
            
            
        }
    }
    
    let skillsCellId = "skillsCellId"
    
    let skillsHeaderId = "skillsHeaderId"
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.showsHorizontalScrollIndicator = false
        cv.showsVerticalScrollIndicator = false
        cv.register(SkillsCollectionCell.self, forCellWithReuseIdentifier: skillsCellId)
        cv.register(SkillsCollectionHeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: skillsHeaderId)
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews() {
        addSubview(collectionView)
        collectionView.fillSuperview()
    }
    
    // MARK: - Collection View Methods
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return skills.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if skills.count > 0 {
            return skills[section].skills.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: skillsCellId, for: indexPath) as! SkillsCollectionCell
        
        
        cell.skill = skills[indexPath.section].skills[indexPath.row]
        
        cell.colors = cellColors[indexPath.section]
        
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width / 2 - 10, height: 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: skillsHeaderId, for: indexPath) as? SkillsCollectionHeaderCell
            header?.textLabel.text = skills[indexPath.section].name
            
            return header!
        }
        
        assert(false, "Invalid element type")
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 50)
    }
}
