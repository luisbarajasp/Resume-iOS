//
//  EmploymentCollectionVIew.swift
//  Resume
//
//  Created by Luis Eduardo Barajas Perez on 7/31/19.
//  Copyright © 2019 Luis Barajas. All rights reserved.
//

import UIKit

class EmploymentCollectionView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var jobs: [Job] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    let cellId = "cellId"
    
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
