//
//  School.swift
//  Resume
//
//  Created by Luis Eduardo Barajas Perez on 7/30/19.
//  Copyright © 2019 Luis Barajas. All rights reserved.
//

import UIKit

class School {
    var imageLink: String?
    var name: String?
    var date: String?
    var degree: String?
    var notes: String?
    
    init(_imageLink: String, _name: String, _date: String, _degree: String, _notes: String) {
        imageLink = _imageLink
        name = _name
        date = _date
        degree = _degree
        notes = _notes
    }
}
