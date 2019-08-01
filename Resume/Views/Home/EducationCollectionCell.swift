//
//  File.swift
//  Resume
//
//  Created by Luis Eduardo Barajas Perez on 7/30/19.
//  Copyright © 2019 Luis Barajas. All rights reserved.
//

import UIKit

class EducationCollectionCell: UICollectionViewCell {
    
    var school: School? {
        didSet {
            if let imageLink = school!.imageLink{
                logoImageView.loadImageUsingCacheWithURLString(imageLink, placeHolder: nil)
            }
            nameLabel.text = school?.name
            dateLabel.text = school?.date
            degreeLabel.text = school?.degree
            notesLabel.text = school?.notes
            
            var colorTop =  UIColor(red: 123, green: 163, blue: 250).cgColor
            var colorBottom = UIColor(red: 104, green: 142, blue: 247).cgColor
            
            if let name = school?.name, name != "Czech Technical University" {
                colorTop =  UIColor(red: 74, green: 73, blue: 171).cgColor
                colorBottom = UIColor(red: 58, green: 57, blue: 143).cgColor
            }
            
            let gradientLayer = CAGradientLayer()
            gradientLayer.colors = [colorTop, colorBottom]
            gradientLayer.locations = [0.0, 1.0]
            gradientLayer.frame = self.bounds
            
            layer.insertSublayer(gradientLayer, at:0)
        }
    }
    
    let logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textAlignment = .center
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    let degreeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    let notesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        label.textColor = .white
        label.numberOfLines = 0
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
        
        layer.cornerRadius = 10
        layer.masksToBounds = true
        clipsToBounds = true
        
        
//        addSubview(logoImageView)
//        logoImageView.anchor(top: topAnchor, leading: nil, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0), size: CGSize(width: 80, height: 80))
//        logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        addSubview(nameLabel)
        nameLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: UIEdgeInsets(top: 15, left: 20, bottom: 0, right: 10), size: CGSize(width: 0, height: 30))
        
        addSubview(dateLabel)
        dateLabel.anchor(top: nameLabel.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: UIEdgeInsets(top: 15, left: 10, bottom: 0, right: 10), size: CGSize(width: 0, height: 20))
        
        addSubview(degreeLabel)
        degreeLabel.anchor(top: dateLabel.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: UIEdgeInsets(top: 5, left: 10, bottom: 0, right: 10), size: CGSize(width: 0, height: 20))
        
        addSubview(notesLabel)
        notesLabel.anchor(top: degreeLabel.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: UIEdgeInsets(top: 5, left: 10, bottom: 0, right: 10), size: CGSize(width: 0, height: 20))
        
    }
}
