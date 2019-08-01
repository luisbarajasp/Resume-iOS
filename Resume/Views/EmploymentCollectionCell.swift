//
//  EmploymentCollectionCell.swift
//  Resume
//
//  Created by Luis Eduardo Barajas Perez on 7/31/19.
//  Copyright © 2019 Luis Barajas. All rights reserved.
//

import UIKit

class EmploymentCollectionCell: UICollectionViewCell {
    
    var job: Job? {
        didSet{
            nameLabel.text = job?.name
            companyLabel.text = job?.company
            dateLabel.text = job?.date
        }
    }
    
    let cornerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = true
        view.clipsToBounds = true
        view.backgroundColor = .white
        return view
    }()
    
    let containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.layer.shadowColor = UIColor.darkGray.cgColor
        view.layer.shadowOffset = CGSize(width: 5.0, height: 2.0)
        view.layer.shadowRadius = 5.0
        view.layer.shadowOpacity = 0.5
        view.layer.masksToBounds = false
        view.clipsToBounds = false
        
        return view
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.sizeToFit()
        label.numberOfLines = 2
        return label
    }()
    
    let companyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.sizeToFit()
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.sizeToFit()
        label.textAlignment = .right
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews() {
        
        addSubview(containerView)
        containerView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        
        containerView.addSubview(cornerView)
        cornerView.fillSuperview()
        
        cornerView.addSubview(nameLabel)
        nameLabel.anchor(top: cornerView.topAnchor, leading: cornerView.leadingAnchor, bottom: nil, trailing: cornerView.trailingAnchor, padding: UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10), size: CGSize(width: 0, height: 45))
        
        cornerView.addSubview(companyLabel)
        companyLabel.anchor(top: nameLabel.bottomAnchor, leading: cornerView.leadingAnchor, bottom: nil, trailing: cornerView.trailingAnchor, padding: UIEdgeInsets(top: 5, left: 10, bottom: 0, right: 10), size: CGSize(width: 0, height: 20))
        
        cornerView.addSubview(dateLabel)
        dateLabel.anchor(top: companyLabel.bottomAnchor, leading: cornerView.leadingAnchor, bottom: nil, trailing: cornerView.trailingAnchor, padding: UIEdgeInsets(top: 15, left: 10, bottom: 0, right: 10), size: CGSize(width: 0, height: 16))
    }
}
