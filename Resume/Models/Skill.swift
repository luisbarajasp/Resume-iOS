//
//  Skill.swift
//  Resume
//
//  Created by Luis Eduardo Barajas Perez on 7/30/19.
//  Copyright © 2019 Luis Barajas. All rights reserved.
//

import Foundation

class Skill {
    
    var name: String!
    var skills: [String] = []
    
    init(_name: String, _skills: [String]) {
        name = _name
        skills = _skills
    }
}
