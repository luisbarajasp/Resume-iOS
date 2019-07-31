//
//  ContentVIew.swift
//  Resume
//
//  Created by Luis Eduardo Barajas Perez on 7/30/19.
//  Copyright © 2019 Luis Barajas. All rights reserved.
//

import UIKit

class ContentView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var summary: String? {
        didSet {
            summaryLabel.text = summary
        }
    }
    
    var schools: [School] = [] {
        didSet {
            educationCollectionView.reloadData()
        }
    }
    
    let summaryTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        label.text = "Summary"
        label.sizeToFit()
        return label
    }()
    
    let summaryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    let educationTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        label.text = "Education"
        label.sizeToFit()
        return label
    }()
    
    let educationCellId = "educationCellId"
    
    lazy var educationCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 7.5
        layout.minimumInteritemSpacing = 7.5
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.showsHorizontalScrollIndicator = false
        cv.showsVerticalScrollIndicator = false
        cv.register(EducationCollectionCell.self, forCellWithReuseIdentifier: educationCellId)
        cv.showsVerticalScrollIndicator = false
        cv.backgroundColor = .white
        cv.isPagingEnabled = false
        cv.sizeToFit()
        
        cv.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
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
        addSubview(summaryTitleLabel)
        summaryTitleLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: UIEdgeInsets(top: 10, left: 20, bottom: 0, right: 20))
        
        addSubview(summaryLabel)
        summaryLabel.anchor(top: summaryTitleLabel.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: UIEdgeInsets(top: 10, left: 20, bottom: 0, right: 20))
        
        addSubview(educationTitleLabel)
        educationTitleLabel.anchor(top: summaryLabel.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: UIEdgeInsets(top: 30, left: 20, bottom: 0, right: 20))
        
        addSubview(educationCollectionView)
        educationCollectionView.anchor(top: educationTitleLabel.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: UIEdgeInsets(top: 10, left: 15, bottom: 0, right: 15), size: CGSize(width: 0, height: 380))
    }
    
    // MARK: - Collection View Methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return schools.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: educationCellId, for: indexPath) as! EducationCollectionCell
        cell.school = schools[indexPath.row]
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 150)
    }
}
