//
//  ContentVIew.swift
//  Resume
//
//  Created by Luis Eduardo Barajas Perez on 7/30/19.
//  Copyright © 2019 Luis Barajas. All rights reserved.
//

/*import UIKit

class ContentView: UIView {
    
    var summary: String? {
        didSet {
            summaryLabel.text = summary
        }
    }
    
    var schools: [School] = [] {
        didSet {
            educationCollectionView.schools = schools
        }
    }
    
    var skills: [Skill] = [] {
        didSet {
            skillsCollectionView.skills = skills
        }
    }
    
    var jobs: [Job] = [] {
        didSet {
            employmentCollectionView.jobs = jobs
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
    
    
    
    let educationCollectionView = EducationCollectionView()
    
    
    
    let skillsCollectionView = SkillsCollectionView()
    
    
    let employmentCollectionView = EmploymentCollectionView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var skillsHeightConstraint: NSLayoutConstraint!
    
    func setUpViews() {
        
       
        
        addSubview(educationCollectionView)
        educationCollectionView.anchor(top: educationTitleLabel.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: UIEdgeInsets(top: 10, left: 15, bottom: 0, right: 15), size: CGSize(width: 0, height: 330))
        
        addSubview(skillsTitleLabel)
        skillsTitleLabel.anchor(top: educationCollectionView.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: UIEdgeInsets(top: 30, left: 20, bottom: 0, right: 20))
        
        addSubview(skillsCollectionView)
        skillsCollectionView.anchor(top: skillsTitleLabel.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: UIEdgeInsets(top: 10, left: 15, bottom: 0, right: 15))
        
        skillsHeightConstraint = NSLayoutConstraint(item: skillsCollectionView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 200)
        skillsHeightConstraint.isActive = true
        
        addSubview(employmentTitleLabel)
        employmentTitleLabel.anchor(top: skillsCollectionView.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: UIEdgeInsets(top: 30, left: 20, bottom: 0, right: 20))
        
        addSubview(employmentCollectionView)
        employmentCollectionView.anchor(top: employmentTitleLabel.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0), size: CGSize(width: 0, height: 140))
        
    }
}*/
