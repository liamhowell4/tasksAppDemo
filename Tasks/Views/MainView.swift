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
            //signed in
            ToDoListView()
            
        } else {
            LoginView()
        }
    }
}

#Preview {
    MainView()
}
