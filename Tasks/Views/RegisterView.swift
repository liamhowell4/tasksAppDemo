//
//  RegisterView.swift
//  Tasks
//
//  Created by Liam Howell on 6/28/24.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var viewModel = RegisterViewModel()
    
    var body: some View {
            // Vertical Stack
            VStack {
                // Header
                // Zstack seems to enable overlaying on top of one another, aligning on axes
                HeaderView(title: "Register", subtitle: "Make an Account!", angle: -15, background: .orange)
                    
                
                // Login Form
                Form{
                    TextField("Your Name", text: $viewModel.name)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                    TextField("Your Email", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButton(title: "Create Account", background: .green) {
                        //Attempt Registration
                        viewModel.register()
                    }
                    
                    
//
                    
                    
                }
                .offset(y:-20)
                
            }
        }
    
}

#Preview {
    RegisterView()
}
