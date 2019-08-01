//
//  Header.swift
//  Resume
//
//  Created by Luis Eduardo Barajas Perez on 7/30/19.
//  Copyright © 2019 Luis Barajas. All rights reserved.
//

import UIKit

class HeaderViewCell: SectionViewCell {
    
    var contact: [[String: AnyObject]]? {
        didSet {
             
            emailButton.text = contact![0]["text"] as? String
            emailButton.urlString = contact![0]["link"] as? String
            
            githubButton.text = contact![1]["text"] as? String
            githubButton.urlString = contact![1]["link"] as? String
            
            phoneButton.text = contact![2]["text"] as? String
            phoneButton.urlString = contact![2]["link"] as? String
        }
    }
    
    let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "me")
        iv.contentMode = .scaleAspectFit
        iv.layer.cornerRadius = 50
        iv.layer.masksToBounds = true
        iv.clipsToBounds = true
        return iv
    }()
    
    let profileIVContainer: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 50
        view.layer.shadowColor = UIColor.darkGray.cgColor
        view.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        view.layer.shadowRadius = 25.0
        view.layer.shadowOpacity = 0.9
        return view
    }()
    
    let backgroundImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "headerbg")
        
        
        return iv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Luis Barajas"
        label.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        label.numberOfLines = 1
        label.sizeToFit()
        return label
    }()
    
    let emailContainer = UIView()
    let githubContainer = UIView()
    let phoneContainer = UIView()
    
    let emailButton = HeaderButton()
    let githubButton = HeaderButton()
    let phoneButton = HeaderButton()
    
    
    override func setUpViews() {
        super.setUpViews()
        
        contentView.addSubview(profileIVContainer)
        profileIVContainer.anchor(top: contentView.safeAreaLayoutGuide.topAnchor, leading: nil, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), size: CGSize(width: 100, height: 100))
        profileIVContainer.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        profileIVContainer.addSubview(profileImageView)
        profileImageView.fillSuperview()
        
        contentView.addSubview(nameLabel)
        nameLabel.anchor(top: profileImageView.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: 15, left: 0, bottom: 0, right: 0))
        nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        emailButton.type = 0
        githubButton.type = 1
        phoneButton.type = 2
        
        contentView.addSubview(emailButton)
        emailButton.anchor(top: nameLabel.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0), size: CGSize(width: 0, height: 20))
        emailButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        contentView.addSubview(githubButton)
        githubButton.anchor(top: emailButton.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0), size: CGSize(width: 0, height: 20))
        githubButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        contentView.addSubview(phoneButton)
        phoneButton.anchor(top: githubButton.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0), size: CGSize(width: 0, height: 20))
        phoneButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        contentView.bottomAnchor.constraint(equalTo: phoneButton.bottomAnchor, constant: 10).isActive = true
    }
}
