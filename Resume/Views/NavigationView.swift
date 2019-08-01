//
//  NavigationView.swift
//  Resume
//
//  Created by Luis Eduardo Barajas Perez on 8/1/19.
//  Copyright © 2019 Luis Barajas. All rights reserved.
//

import UIKit

class NavigationView: UIView {
    
    var emailUrl: String = ""
    var githubUrl: String = ""
    var phoneUrl: String = ""
    
    let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "me")
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 15
        iv.layer.masksToBounds = true
        iv.clipsToBounds = true
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
    
    lazy var emailButton: UIButton = {
        let b = UIButton()
        b.addTarget(self, action: #selector(self.emailButtonPressed), for: .touchDown)
        b.setImage(UIImage(named: "email"), for: .normal)
        b.imageView?.contentMode = .scaleAspectFit
        return b
    }()
    
    lazy var githubButton: UIButton = {
        let b = UIButton()
        b.addTarget(self, action: #selector(self.githubButtonPressed), for: .touchDown)
        b.setImage(UIImage(named: "github"), for: .normal)
        b.imageView?.contentMode = .scaleAspectFit
        return b
    }()
    
    lazy var phoneButton: UIButton = {
        let b = UIButton()
        b.addTarget(self, action: #selector(self.phoneButtonPressed), for: .touchDown)
        b.setImage(UIImage(named: "phone"), for: .normal)
        b.imageView?.contentMode = .scaleAspectFit
        return b
    }()
    
    var isHome = true
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
        
        if isHome {
            
            addSubview(nameLabel)
            nameLabel.anchor(top: safeAreaLayoutGuide.topAnchor, leading: safeAreaLayoutGuide.leadingAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, trailing: nil, padding: UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20))
            
            addSubview(profileImageView)
            profileImageView.translatesAutoresizingMaskIntoConstraints = false
            profileImageView.topAnchor.constraint(equalTo: nameLabel.topAnchor).isActive = true
            profileImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
            profileImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
            profileImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
            
            addSubview(phoneButton)
            phoneButton.anchor(top: nameLabel.topAnchor, leading: nil, bottom: nameLabel.bottomAnchor, trailing: safeAreaLayoutGuide.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20), size: CGSize(width: 20, height: 0))
            
            addSubview(githubButton)
            githubButton.anchor(top: nameLabel.topAnchor, leading: nil, bottom: nameLabel.bottomAnchor, trailing: phoneButton.leadingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20), size: CGSize(width: 20, height: 0))
            
            addSubview(emailButton)
            emailButton.anchor(top: nameLabel.topAnchor, leading: nil, bottom: nameLabel.bottomAnchor, trailing: githubButton.leadingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20), size: CGSize(width: 20, height: 0))
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews() {
        backgroundColor = .white
    }
    
    @objc
    func emailButtonPressed() {
        if emailUrl != "", let url = URL(string: emailUrl), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
    @objc
    func githubButtonPressed() {
        if githubUrl != "", let url = URL(string: githubUrl), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
    @objc
    func phoneButtonPressed() {
        if phoneUrl != "", let url = URL(string: phoneUrl), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
}
