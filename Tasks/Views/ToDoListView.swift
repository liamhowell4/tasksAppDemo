//
//  ToDoListItemsView.swift
//  Tasks
//
//  Created by Liam Howell on 6/28/24.
//

import SwiftUI
import FirebaseFirestoreSwift

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
//    private let userID: String
    
    init(userID: String) {
//        self.userID = userID
        
        // Firestore structure users/<id>/todos/<entries>
        self._items = FirestoreQuery(
            collectionPath: "users/\(userID)/todos"
        )
        self._viewModel = StateObject(
            wrappedValue: ToDoListViewModel(
                userID: userID
            )
        )
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            Button {
                                viewModel.delete(id: item.id)
                            } label: {
                                Text("Delete")
                            }
                            .tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    // Action
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

#Preview {
    ToDoListView(userID: "g4BBmLm874UJOl1ncOdLqbByEOB3")
}
