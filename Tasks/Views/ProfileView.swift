//
//  ProfileView.swift
//  Tasks
//
//  Created by Liam Howell on 6/28/24.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewModel()
    
    init() {
        
    }
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    profile(user: user)
                    
                } else {
                    Text("Loading Profile...")
                }
                
            }
            .navigationTitle("Your Profile")
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        // Avatar
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.green)
            .frame(width: 125, height: 125)
            .padding(20)
        
        // Info: Name, email, Member Since
        VStack(alignment: .leading) {
            HStack {
                Text("Name: ")
                    .bold()
                Text(user.name)
            }
            .padding(2)
            
            HStack {
                Text("Email: ")
                    .bold()
                Text(user.email)
            }
            .padding(2)
            
            HStack {
                Text("Member Since: ")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
            .padding(2)
            
        }
        
        // Sign Out Button
        Button("Log Out") {
            viewModel.logOut()
        }
        .tint(.red)
        .padding()
        
        Spacer()
        
    }
}

#Preview {
    ProfileView()
}
