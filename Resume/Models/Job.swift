//
//  Job.swift
//  Resume
//
//  Created by Luis Eduardo Barajas Perez on 7/31/19.
//  Copyright © 2019 Luis Barajas. All rights reserved.
//

import Foundation

class Job {
    var name: String?
    var city: String?
    var company: String?
    var date: String?
    var description: String?
    
    init(_name: String, _city: String, _company: String, _date: String, _description: String) {
        name = _name
        city = _city
        company = _company
        date = _date
        description = _description
    }
}
