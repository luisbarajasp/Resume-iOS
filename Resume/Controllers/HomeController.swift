//
//  ViewController.swift
//  Resume
//
//  Created by Luis Eduardo Barajas Perez on 7/30/19.
//  Copyright © 2019 Luis Barajas. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    
    var resume: [String: AnyObject]? {
        didSet {
            updateValues()
        }
    }
    
    var scrollView = UIScrollView()
    var parentView = UIView()
    
    var headerView = HeaderView()
    var contentView = ContentView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        downloadResume()
        setUpViews()
        
    }

    
    // MARK: - Download Resume
    
    private func downloadResume() {
        let service = APIService()
        service.getDataWith { (result) in
            switch result {
            case .Success(let data):
//                print(data)
                self.resume = data
            case .Error(let message):
                DispatchQueue.main.async {
                    self.showAlertWith(title: "Error", message: message)
                }
            }
        }
    }
    
    // MARK: - Update UI
    private func updateValues() {
        guard let contactJsonArray = resume!["Contact"] as? [[String: AnyObject]] else { return showAlertWith(title: "Error", message: "Invalid JSON")}
        headerView.contact = contactJsonArray
        contentView.summary = resume!["Summary"] as? String
        
        guard let schoolsJsonArray = resume!["Education"] as? [[String: AnyObject]] else { return showAlertWith(title: "Error", message: "Invalid JSON")}
        
        var schools: [School] = []
        
        for schoolJson in schoolsJsonArray {
            schools.append(School(_imageLink: schoolJson["imageLink"] as! String, _name: schoolJson["name"] as! String, _date: schoolJson["date"] as! String, _degree: schoolJson["degree"] as! String, _notes: schoolJson["notes"] as! String))
        }
        
        contentView.schools = schools
        
        var skills: [Skill] = []
        
        guard let skillsJsonArray = resume!["Skills"] as? [[String: AnyObject]] else { return showAlertWith(title: "Error", message: "Invalid JSON")}
        
        for skillJson in skillsJsonArray {
            skills.append(Skill(_name: skillJson["name"] as! String, _skills: skillJson["items"] as! [String]))
        }
        
        contentView.skills = skills
        
        print(scrollView.contentSize)
        
    }
    
    func setUpViews() {
        
        view.addSubview(scrollView)
        scrollView.fillSuperview()
        
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        scrollView.addSubview(parentView)
        parentView.anchor(top: scrollView.topAnchor, leading: scrollView.leadingAnchor, bottom: scrollView.bottomAnchor, trailing: scrollView.trailingAnchor)
        
        parentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        parentView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor).isActive = true
        
        parentView.addSubview(headerView)
        headerView.controller = self
        headerView.anchor(top: parentView.topAnchor, leading: parentView.leadingAnchor, bottom: nil, trailing: parentView.trailingAnchor, size: CGSize(width: 0, height: 325))
        
        parentView.addSubview(contentView)
        contentView.anchor(top: headerView.bottomAnchor, leading: parentView.safeAreaLayoutGuide.leadingAnchor, bottom: parentView.safeAreaLayoutGuide.bottomAnchor, trailing: parentView.safeAreaLayoutGuide.trailingAnchor, padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0))
    }
    
    // MARK: - Alerts
    
    func showAlertWith(title: String, message: String, style: UIAlertController.Style = .alert) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let action = UIAlertAction(title: "OK", style: .default) { (action) in
            self.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }

}

