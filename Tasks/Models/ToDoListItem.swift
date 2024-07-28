//
//  ToDoListItem.swift
//  Tasks
//
//  Created by Liam Howell on 6/28/24.
//

import Foundation

struct ToDoListItem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    
    mutating func setDone (_ state: Bool) {
        isDone = state
    }
}
