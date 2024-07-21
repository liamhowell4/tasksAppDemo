//
//  LoginViewModel.swift
//  Tasks
//
//  Created by Liam Howell on 6/28/24.
//

import FirebaseAuth
import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {}
    
    func login () {
        guard validate() else {
            return
        }
        
        // Try log in
        Auth.auth().signIn(withEmail: email, password: password)
        
    }
    
    private func validate() -> Bool {
        
        errorMessage = ""
        
        // Make sure the fields aren't empty
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            
            errorMessage = "Please Fill in All Fields"
            
            return false
        }
            
        // Make sure there is an @ symbol and a period
        guard email.contains("@") && email.split(
            separator: "@")[1].contains(".") else {
            
            errorMessage = "Please enter valid email."
            
            return false
        }
    
        
        print("Called")
            
        return true
    }
    
    func validate() {
        
    }
}
