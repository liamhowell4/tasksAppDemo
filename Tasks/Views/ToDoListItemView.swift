//
//  ToDoListItemView.swift
//  Tasks
//
//  Created by Liam Howell on 6/28/24.
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject var viewModel = ToDoListItemViewModel()
    let item: ToDoListItem
    
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.body)
                    .bold()
                
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            
            Spacer()
            
            Button {
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill": "circle")
                    .foregroundColor(.green)
            }
        }
    }
}

#Preview {
    ToDoListItemView(item: .init(
        id: "123", title: "Get more Eggs",
        dueDate:Date().timeIntervalSince1970,
        createdDate: Date().timeIntervalSince1970,
        isDone: false))
}
