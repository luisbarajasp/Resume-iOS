//
//  File.swift
//  Resume
//
//  Created by Luis Eduardo Barajas Perez on 8/1/19.
//  Copyright © 2019 Luis Barajas. All rights reserved.
//

import Foundation

class Project {
    var name: String?
    var date: String?
    var description: String?
    var link: String?
    
    init(_name: String, _date: String, _description: String, _link: String?) {
        name = _name
        date = _date
        description = _description
        link = _link
    }
}
