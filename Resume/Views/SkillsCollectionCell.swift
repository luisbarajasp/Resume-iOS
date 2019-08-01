//
//  SkillsCollectionCell.swift
//  Resume
//
//  Created by Luis Eduardo Barajas Perez on 7/30/19.
//  Copyright © 2019 Luis Barajas. All rights reserved.
//

import UIKit

class SkillsCollectionCell: UICollectionViewCell {
    
    var skill: String? {
        didSet {
            skillLabel.text = skill
        }
    }
    
    var colors: [UIColor]? {
        didSet {
            DispatchQueue.main.async {
                let colorTop =  self.colors![0].cgColor
                let colorBottom = self.colors![1].cgColor
                
                let gradientLayer = CAGradientLayer()
                gradientLayer.colors = [colorTop, colorBottom]
                gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
                gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
                gradientLayer.frame = self.bounds
                
                self.containerView.layer.insertSublayer(gradientLayer, at:0)
            }
        }
    }
    
    let skillLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.textColor = .white
        label.sizeToFit()
        return label
    }()
    
    let containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = true
        view.clipsToBounds = true
        return view
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
        containerView.fillSuperview()
        
        containerView.addSubview(skillLabel)
        skillLabel.anchor(top: containerView.topAnchor, leading: containerView.leadingAnchor, bottom: containerView.bottomAnchor, trailing: containerView.trailingAnchor, padding: UIEdgeInsets(top: 3, left: 10, bottom: 3, right: 10))
    }
}
