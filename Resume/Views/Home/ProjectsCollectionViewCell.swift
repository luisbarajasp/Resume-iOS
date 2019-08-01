//
//  ProjectsCollectionViewCell.swift
//  Resume
//
//  Created by Luis Eduardo Barajas Perez on 8/1/19.
//  Copyright © 2019 Luis Barajas. All rights reserved.
//

import UIKit

class ProjectsCollectionViewCell: SectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var controller: HomeController!
    
    var projects: [Project] = [] {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
                self.collectionView.layoutIfNeeded()
            }
        }
    }
    
    let cellId = "cellId"
    
    let projectsTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        label.text = "Projects"
        label.sizeToFit()
        return label
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.register(ProjectCollectionCell.self, forCellWithReuseIdentifier: cellId)
        cv.backgroundColor = .white
        cv.isScrollEnabled = true
        
        cv.showsHorizontalScrollIndicator = false
        
        cv.contentInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        
        return cv
    }()
    
    override func setUpViews() {
        contentView.addSubview(projectsTitleLabel)
        projectsTitleLabel.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: nil, trailing: contentView.trailingAnchor, padding: UIEdgeInsets(top: 10, left: 20, bottom: 0, right: 20))
        
        contentView.addSubview(collectionView)
        collectionView.anchor(top: projectsTitleLabel.bottomAnchor, leading: contentView.leadingAnchor, bottom: nil, trailing: contentView.trailingAnchor, padding: UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0), size: CGSize(width: 0, height: 130))
        
        contentView.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor).isActive = true
    }
    
    // MARK: - CollectionView Methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return projects.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ProjectCollectionCell
        
        cell.project = projects[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: collectionView.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        controller.didSelectProject(projects[indexPath.row])
    }
}

