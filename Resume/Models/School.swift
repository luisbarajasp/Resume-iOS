//
//  School.swift
//  Resume
//
//  Created by Luis Eduardo Barajas Perez on 7/30/19.
//  Copyright © 2019 Luis Barajas. All rights reserved.
//

import UIKit

class School {
    var name: String?
    var date: String?
    var degree: String?
    var notes: String?
    
    init(_name: String, _date: String, _degree: String, _notes: String) {
        name = _name
        date = _date
        degree = _degree
        notes = _notes
    }
}
