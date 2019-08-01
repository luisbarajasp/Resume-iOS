//
//  SkillsCollectionHeaderCell.swift
//  Resume
//
//  Created by Luis Eduardo Barajas Perez on 7/31/19.
//  Copyright © 2019 Luis Barajas. All rights reserved.
//

import UIKit

class SkillsCollectionHeaderCell: UICollectionReusableView {
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
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
        addSubview(textLabel)
        textLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: UIEdgeInsets(top: 5, left: 5, bottom: 0, right: 0))
    }
}
