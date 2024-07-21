//
//  LoginView.swift
//  Tasks
//
//  Created by Liam Howell on 6/28/24.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationView {
            // Vertical Stack
            VStack {
                // Header
                // Zstack seems to enable overlaying on top of one another, aligning on axes
                HeaderView(title: "Login", subtitle: "Get Shit Done", angle: 15, background: .pink).offset(y:50)
                
                // Login Form
                Form{
                    
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    
                    TextField("Email", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButton(
                        title: "Log In",
                        background: .blue) {
                            viewModel.login()
                    }
                    
                }
                
                // Register Link/Create Account
                VStack {
                    Text("New around here?")
                    
                    // This will take us to this other view
                    NavigationLink("Create an Account", destination: RegisterView())
                    
                    .padding(.bottom, 40)
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
