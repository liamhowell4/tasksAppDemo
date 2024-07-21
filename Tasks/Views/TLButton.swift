//
//  TLButton.swift
//  Tasks
//
//  Created by Liam Howell on 7/9/24.
//

import SwiftUI

struct TLButton: View {
    
    let title: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
        Button (
            //Attempt log in
            action: {
                action()
            }, label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundColor(background)
                    
                    Text(title)
                        .foregroundColor(.white)
                        .bold()
                }
            }).padding()
    }
}

#Preview {
    TLButton(title:"Login", background: .blue) {
        //Action
    }
}
