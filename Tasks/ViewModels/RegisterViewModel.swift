//
//  RegisterViewModel.swift
//  Tasks
//
//  Created by Liam Howell on 6/28/24.
//

import FirebaseAuth
import Foundation
import FirebaseFirestore

class RegisterViewModel: ObservableObject {
    
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {}
    
    // Authenticate input, send input to firebase, create record
    func register() {
        guard validate() else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in 
            guard let userID = result?.user.uid else {
                return
            }
            
            self?.insertUserRecord(id: userID)
            
        }
    }
    
    private func insertUserRecord(id: String) {
        let newUser = User(id: id,
                           name: name,
                           email: email,
                           joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
            
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    private func validate() -> Bool {
        errorMessage = ""
        
        // Make sure the fields aren't empty
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty,
              !name.trimmingCharacters(in: .whitespaces).isEmpty else {
            
            errorMessage = "Please Fill in All Fields"
            
            return false
        }
        
        // Make sure there is an @ symbol and a period
        guard email.contains("@") && email.split(
            separator: "@")[1].contains(".") else {
            
            errorMessage = "Please enter valid email."
            
            return false
        }
        
        // password has to be at least 6 chars long and contains a number
        guard password.count >= 6 && password.rangeOfCharacter(from: .decimalDigits) != nil else {
            return false
        }
        
        return true
    }
    
}
