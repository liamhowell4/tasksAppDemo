//
//  TasksApp.swift
//  Tasks
//
//  Created by Liam Howell on 6/28/24.
//

import SwiftUI
import FirebaseCore

@main
struct TasksApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
