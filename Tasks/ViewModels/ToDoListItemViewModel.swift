//
//  ToDoListItemViewModel.swift
//  Tasks
//
//  Created by Liam Howell on 6/28/24.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

// View Model for single todo list item view (each row in items list)
class ToDoListItemViewModel: ObservableObject {
    
    init() {}
    
    func toggleIsDone(item: ToDoListItem) {
        var mutableItem = item
        mutableItem.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(mutableItem.id)
            .setData(mutableItem.asDictionary())
    }
}
