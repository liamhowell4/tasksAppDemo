//
//  User.swift
//  Tasks
//
//  Created by Liam Howell on 6/28/24.
//

import Foundation

struct User: Codable {
    
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
    
}
