//
//  HeaderButton.swift
//  Resume
//
//  Created by Luis Eduardo Barajas Perez on 7/30/19.
//  Copyright © 2019 Luis Barajas. All rights reserved.
//

import UIKit

class HeaderButton: UIView {
    
    var type: Int? {
        didSet {
            if let t = type {
                switch t {
                case 0:
                    iconImageView.image = UIImage(named: "email")
                case 1:
                    iconImageView.image = UIImage(named: "github")
                case 2:
                    iconImageView.image = UIImage(named: "phone")
                default:
                    iconImageView.image = UIImage(named: "email")
                }
            }
        }
    }
    
    var text: String? {
        didSet {
            if let t = text {
                textLabel.text = t
            }
        }
    }
    
    var urlString: String?
    
    let iconImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        label.sizeToFit()
        return label
    }()
    
    lazy var button: UIButton = {
        let b = UIButton()
        b.addTarget(self, action: #selector(self.buttonPressed), for: .touchDown)
        return b
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews() {
        
        addSubview(iconImageView)
        iconImageView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: nil, size: CGSize(width: 20, height: 0))
        
        addSubview(textLabel)
        textLabel.anchor(top: topAnchor, leading: iconImageView.trailingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0))
        
        addSubview(button)
        button.fillSuperview()
    }
    
    @objc
    func buttonPressed() {
        if let urlS = urlString, let url = URL(string: urlS), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
}
