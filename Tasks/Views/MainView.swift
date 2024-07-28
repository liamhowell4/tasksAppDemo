//
//  ContentView.swift
//  Tasks
//
//  Created by Liam Howell on 6/28/24.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewModel()
    
    
    // Show Login view
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            //If signed in show a tab view
               accountView
        } else {
            LoginView()
        }
    }
    
    
    @ViewBuilder
    var accountView: some View {
        TabView {
            ToDoListView(userID: viewModel.currentUserId)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }

    }
}

#Preview {
    MainView()
}
