//
//  ToDoListViewModel.swift
//  Tasks
//
//  Created by Liam Howell on 6/28/24.
//

import Foundation

import FirebaseFirestore

//View Model for list of items view
//Primary tab
class ToDoListViewModel: ObservableObject {
    @Published var showingNewItemView: Bool = false
    
    private let userID: String
    
    init(userID: String) {
        self.userID = userID
    }
    
    
    /// Delete to do list item
    ///  - Parameter id: item id to delete
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userID)
            .collection("todos")
            .document(id)
            .delete()
        
    }
}
