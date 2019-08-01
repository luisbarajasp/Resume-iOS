//
//  ViewController.swift
//  Resume
//
//  Created by Luis Eduardo Barajas Perez on 7/30/19.
//  Copyright © 2019 Luis Barajas. All rights reserved.
//

import UIKit

class HomeController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var resume: [String: AnyObject]? {
        didSet {
            updateValues()
        }
    }
    
    let headerViewId = "headerViewId"
    let summaryViewId = "summaryViewId"
    let skillsViewId = "skillsViewId"
    let educationViewId = "educationViewId"
    let employmentViewId = "employmentViewId"
    let projectsViewId = "projectsViewId"
    let awardsViewId = "awardsViewId"
    let languagesViewId = "languagesViewId"
    
    private var lastContentOffset: CGFloat = 0
    
    lazy var parentView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        layout.estimatedItemSize = CGSize(width: self.view.bounds.width, height: 10)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.showsHorizontalScrollIndicator = false
        cv.showsVerticalScrollIndicator = false
        
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "default")
        
        cv.register(HeaderViewCell.self, forCellWithReuseIdentifier: headerViewId)
        cv.register(SummaryViewCell.self, forCellWithReuseIdentifier: summaryViewId)
        cv.register(EducationCollectionViewCell.self, forCellWithReuseIdentifier: educationViewId)
        cv.register(SkillsCollectionViewCell.self, forCellWithReuseIdentifier: skillsViewId)
        cv.register(EmploymentCollectionViewCell.self, forCellWithReuseIdentifier: employmentViewId)
        cv.register(ProjectsCollectionViewCell.self, forCellWithReuseIdentifier: projectsViewId)
        cv.register(AwardsCollectionViewCell.self, forCellWithReuseIdentifier: awardsViewId)
        cv.register(LanguagesCollectionViewCell.self, forCellWithReuseIdentifier: languagesViewId)
        
        cv.showsVerticalScrollIndicator = false
        cv.backgroundColor = .white
        cv.isPagingEnabled = false
        
        cv.contentInset = UIEdgeInsets(top: 40, left: 0, bottom: 0, right: 0)
        
        return cv
    }()
    
    let navigationView = NavigationView()
    
    var navigationViewTop: NSLayoutConstraint!
    
    var navigationViewBottom: NSLayoutConstraint!

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
        
        parentView.reloadData()
        
    }
    
    func setUpViews() {
        
        view.addSubview(parentView)
        parentView.fillSuperview()
        
        navigationView.controller = self
        
        view.addSubview(navigationView)
        navigationView.anchor(top: nil, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, size: CGSize(width: 0, height: 100))
        
        navigationViewTop = navigationView.topAnchor.constraint(equalTo: view.topAnchor, constant: -100)
        
        navigationViewTop.isActive = true

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
    
    // MARK: - Collection View Methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return resume?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var c: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "default", for: indexPath)
        
        switch indexPath.row {
            case 0:
            // Header
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: headerViewId, for: indexPath) as! HeaderViewCell
                
                guard let contactJsonArray = resume!["Contact"] as? [[String: AnyObject]] else { assert(false, "Invalid JSON")}
                cell.contact = contactJsonArray
                
                c = cell
            case 1:
            // Summary
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: summaryViewId, for: indexPath) as! SummaryViewCell
                cell.summary = resume!["Summary"] as? String
                
                c = cell
                
                
            
            case 2:
            // Education
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: educationViewId, for: indexPath) as! EducationCollectionViewCell
                
                guard let schoolsJsonArray = resume!["Education"] as? [[String: AnyObject]] else { assert(false, "Invalid JSON")}
                
                var schools: [School] = []
                
                for schoolJson in schoolsJsonArray {
                    schools.append(School(_name: schoolJson["name"] as! String, _date: schoolJson["date"] as! String, _degree: schoolJson["degree"] as! String, _notes: schoolJson["notes"] as! String))
                }
                
                cell.schools = schools
                
                c = cell
            case 3:
                // Employment
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: employmentViewId, for: indexPath) as! EmploymentCollectionViewCell
                
                var jobs: [Job] = []
                
                guard let jobsJsonArray = resume!["Employment"] as? [[String: AnyObject]] else { assert(false, "Invalid JSON")}
                
                for jobJson in jobsJsonArray {
                    jobs.append(Job(_name: jobJson["name"] as! String,  _city: jobJson["city"] as! String, _company: jobJson["company"] as! String, _date: jobJson["date"] as! String, _description: jobJson["description"] as! String))
                }
                
                cell.controller = self
                
                cell.jobs = jobs
                
                c = cell
            case 4:
                // Projects
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: projectsViewId, for: indexPath) as! ProjectsCollectionViewCell
                
                var projects: [Project] = []
                
                guard let projectsJsonArray = resume!["Projects"] as? [[String: AnyObject]] else { assert(false, "Invalid JSON")}
                
                for projectJson in projectsJsonArray {
                    projects.append(Project(_name: projectJson["name"] as! String, _date: projectJson["date"] as! String, _description: projectJson["description"] as! String))
                }
                
                cell.controller = self
                
                cell.projects = projects
                
                c = cell
            case 5:
            // Skills
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: skillsViewId, for: indexPath) as! SkillsCollectionViewCell
                
                var skills: [Skill] = []
                
                guard let skillsJsonArray = resume!["Skills"] as? [[String: AnyObject]] else { assert(false, "Invalid JSON")}
                
                for skillJson in skillsJsonArray {
                    skills.append(Skill(_name: skillJson["name"] as! String, _skills: skillJson["items"] as! [String]))
                }
                
                cell.skills = skills
                
                c = cell
            case 6:
            // Awards
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: awardsViewId, for: indexPath) as! AwardsCollectionViewCell
                
                guard let awardsJsonArray = resume!["Awards"] as? [[String: AnyObject]] else { assert(false, "Invalid JSON")}
                
                var awards: [Award] = []
                
                for awardJson in awardsJsonArray {
                    awards.append(Award(_name: awardJson["name"] as! String, _date: awardJson["date"] as! String, _description: awardJson["description"] as! String))
                }
                
                cell.title = "Awards"
                cell.awards = awards
                
                c = cell
            case 7:
            // Volunteering
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: awardsViewId, for: indexPath) as! AwardsCollectionViewCell
                
                guard let awardsJsonArray = resume!["Volunteering"] as? [[String: AnyObject]] else { assert(false, "Invalid JSON")}
                
                var awards: [Award] = []
                
                for awardJson in awardsJsonArray {
                    awards.append(Award(_name: awardJson["name"] as! String, _date: awardJson["date"] as! String, _description: awardJson["description"] as! String))
                }
                
                cell.title = "Volunteering"
                cell.awards = awards
                
                c = cell
            case 8:
            // Languages
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: languagesViewId, for: indexPath) as! LanguagesCollectionViewCell
                
                var languages: [Language] = []
                
                guard let languagesJsonArray = resume!["Languages"] as? [[String: AnyObject]] else { assert(false, "Invalid JSON")}
                
                for languageJson in languagesJsonArray {
                    languages.append(Language(_name: languageJson["name"] as! String, _level: languageJson["level"] as! String))
                }
                
                cell.languages = languages
                
                c = cell
            default:
            break
            // Nothing
            
        }
        return c
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == parentView {
            let contentOffsetY = scrollView.contentOffset.y
            
            if contentOffsetY < 200 {
                navigationViewTop.constant = -100
            }else{
                navigationViewTop.constant = 0
            }
            
            UIView.animate(withDuration: 0.2, delay: 0, options: [.curveEaseInOut], animations: {
                self.view.layoutIfNeeded()
            }, completion: nil)
            
            // update the new position acquired
            self.lastContentOffset = contentOffsetY
        }
    }
    
    // MARK: - Callbacks Functions
    
    func didSelectJob(_ job: Job) {
        let jobController = JobController()
        jobController.job = job
        navigationController?.pushViewController(jobController, animated: true)
    }
    
    func didSelectProject(_ project: Project) {
        let projectController = ProjectController()
        projectController.project = project
        navigationController?.pushViewController(projectController, animated: true)
    }

}

