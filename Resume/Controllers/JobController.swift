//
//  JobController.swift
//  Resume
//
//  Created by Luis Eduardo Barajas Perez on 8/1/19.
//  Copyright © 2019 Luis Barajas. All rights reserved.
//

import UIKit

class JobController: UIViewController {
    
    var job: Job? {
        didSet {
            cityLabel.text = job?.city
            nameLabel.text = job?.name
            companyLabel.text = job?.company
            dateLabel.text = job?.date
            descriptionLabel.text = job?.description
        }
    }
    
    let containerView = UIView()
    
    let cityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .light)
        label.textAlignment = .center
        label.textColor = UIColor(red: 114, green: 168, blue: 252)
        return label
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 32, weight: .semibold)
        label.numberOfLines = 2
        label.textAlignment = .center
//        label.textColor = UIColor(red: 130, green: 125, blue: 200)
        label.sizeToFit()
        return label
    }()
    
    let companyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        label.textAlignment = .left
//        label.textColor = UIColor(red: 114, green: 168, blue: 252)
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
    
    let navigationView = NavigationView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpViews()
    }
    
    func setUpViews() {
        if job != nil {
            view.backgroundColor = .white
            
            navigationView.controller = self
            
            view.addSubview(navigationView)
            navigationView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, size: CGSize(width: 0, height: 100))
            
            view.addSubview(containerView)
            containerView.anchor(top: nil, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20))
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
            
            containerView.addSubview(cityLabel)
            cityLabel.anchor(top: containerView.topAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: containerView.trailingAnchor, padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0))
            
            containerView.addSubview(nameLabel)
            nameLabel.anchor(top: cityLabel.bottomAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: containerView.trailingAnchor, padding: UIEdgeInsets(top: 40, left: 0, bottom: 0, right: 0))
            
            containerView.addSubview(companyLabel)
            companyLabel.anchor(top: nameLabel.bottomAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: containerView.trailingAnchor, padding: UIEdgeInsets(top: 40, left: 0, bottom: 0, right: 0))
            
            containerView.addSubview(dateLabel)
            dateLabel.anchor(top: companyLabel.bottomAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: containerView.trailingAnchor, padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0))
            
            containerView.addSubview(descriptionLabel)
            descriptionLabel.anchor(top: dateLabel.bottomAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: containerView.trailingAnchor, padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0))
            
            containerView.bottomAnchor.constraint(equalTo: descriptionLabel.bottomAnchor).isActive = true
            
            
        }else{
            navigationController?.popViewController(animated: true)
        }
    }
    
    // MARK: - Callback methods
    
    func navigationBackPressed() {
        navigationController?.popViewController(animated: true)
    }

}
