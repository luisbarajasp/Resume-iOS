//
//  ProjectController.swift
//  Resume
//
//  Created by Luis Eduardo Barajas Perez on 8/1/19.
//  Copyright © 2019 Luis Barajas. All rights reserved.
//

import UIKit

class ProjectController: UIViewController {
    
    var project: Project? {
        didSet {
            nameLabel.text = project?.name
            dateLabel.text = project?.date
            descriptionLabel.text = project?.description
            
            setUpViews()
        }
    }
    
    let containerView = UIView()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 32, weight: .semibold)
        label.numberOfLines = 2
        label.textAlignment = .center
        //        label.textColor = UIColor(red: 130, green: 125, blue: 200)
        label.sizeToFit()
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .light)
        label.textAlignment = .left
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .light)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    lazy var linkButton: UIButton = {
        let button = UIButton()
        button.setTitle("View repository", for: .normal)
        button.setTitleColor(UIColor(red: 146, green: 114, blue: 247), for: .normal)
        button.addTarget(self, action: #selector(self.linkPressed), for: .touchDown)
        button.sizeToFit()
        return button
    }()
    
    let navigationView = NavigationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    func setUpViews() {
            
        navigationView.controller = self
        
        view.addSubview(navigationView)
        navigationView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, size: CGSize(width: 0, height: 100))
        
        view.addSubview(containerView)
        containerView.anchor(top: nil, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20))
        containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        containerView.addSubview(nameLabel)
        nameLabel.anchor(top: containerView.topAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: containerView.trailingAnchor, padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0))
        
        if project?.link != nil {
            containerView.addSubview(linkButton)
            linkButton.anchor(top: nameLabel.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0), size: CGSize(width: 0, height: 30))
            linkButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        }
        
        containerView.addSubview(dateLabel)
        dateLabel.anchor(top: nameLabel.bottomAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: containerView.trailingAnchor, padding: UIEdgeInsets(top: 80, left: 0, bottom: 0, right: 0))
        
        containerView.addSubview(descriptionLabel)
        descriptionLabel.anchor(top: dateLabel.bottomAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: containerView.trailingAnchor, padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0))
        
        containerView.bottomAnchor.constraint(equalTo: descriptionLabel.bottomAnchor).isActive = true
        
        
    }
    
    @objc
    func linkPressed() {
        if let urlS = project?.link, let url = URL(string: urlS), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
    // MARK: - Callback methods
    
    func navigationBackPressed() {
        navigationController?.popViewController(animated: true)
    }
    
    
}
