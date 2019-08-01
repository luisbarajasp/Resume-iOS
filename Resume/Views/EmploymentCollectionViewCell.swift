//
//  EmploymentCollectionVIew.swift
//  Resume
//
//  Created by Luis Eduardo Barajas Perez on 7/31/19.
//  Copyright © 2019 Luis Barajas. All rights reserved.
//

import UIKit

class EmploymentCollectionViewCell: SectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var jobs: [Job] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    let cellId = "cellId"
    
    let employmentTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        label.text = "Employment"
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
        cv.register(EmploymentCollectionCell.self, forCellWithReuseIdentifier: cellId)
        cv.backgroundColor = .white
        cv.isScrollEnabled = true
        cv.isPagingEnabled = true
        
        cv.contentInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        
        return cv
    }()
    
    override func setUpViews() {
        contentView.addSubview(employmentTitleLabel)
        employmentTitleLabel.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: nil, trailing: contentView.trailingAnchor, padding: UIEdgeInsets(top: 10, left: 20, bottom: 0, right: 20))
        
        contentView.addSubview(collectionView)
        collectionView.anchor(top: employmentTitleLabel.bottomAnchor, leading: contentView.leadingAnchor, bottom: nil, trailing: contentView.trailingAnchor, padding: UIEdgeInsets(top: 10, left: 15, bottom: 0, right: 15))
        
        contentView.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor).isActive = true
    }
    
    // MARK: - CollectionView Methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return jobs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? EmploymentCollectionCell
        
        cell!.job = jobs[indexPath.row]
        
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: collectionView.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(jobs[indexPath.row].name)
    }
}
