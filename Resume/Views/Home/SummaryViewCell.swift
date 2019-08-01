//
//  SummaryViewCell.swift
//  Resume
//
//  Created by Luis Eduardo Barajas Perez on 8/1/19.
//  Copyright © 2019 Luis Barajas. All rights reserved.
//

import UIKit

class SummaryViewCell: SectionViewCell {
    
    var summary: String? {
        didSet {
            summaryLabel.text = summary
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
    
    override func setUpViews() {
        super.setUpViews()
        
        contentView.addSubview(summaryTitleLabel)
        summaryTitleLabel.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: nil, trailing: contentView.trailingAnchor, padding: UIEdgeInsets(top: 10, left: 20, bottom: 0, right: 20))
        
        contentView.addSubview(summaryLabel)
        summaryLabel.anchor(top: summaryTitleLabel.bottomAnchor, leading: contentView.leadingAnchor, bottom: nil, trailing: contentView.trailingAnchor, padding: UIEdgeInsets(top: 10, left: 20, bottom: 0, right: 20))
        
        contentView.bottomAnchor.constraint(equalTo: summaryLabel.bottomAnchor).isActive = true
        
    }
}
