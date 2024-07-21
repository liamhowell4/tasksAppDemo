//
//  LoginHeaderView.swift
//  Tasks
//
//  Created by Liam Howell on 6/28/24.
//

import SwiftUI

struct HeaderView: View {
    
    let title: String
    let subtitle: String
    let angle: Double
    let background: Color
    
    var body: some View {
        // Header
        // Zstack seems to enable overlaying on top of one another, aligning on axes
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background)
                .rotationEffect(Angle(degrees: angle))
                
            
            VStack{
                Text(title)
                    .font(.system(size: 50))
                    .foregroundColor(Color.white)
                    .bold()
                
                Text(subtitle)
                    .font(.system(size: 30))
                    .foregroundColor(Color.white)
            }
            .padding(.top, 30)
        }
        .frame(width: UIScreen.main.bounds.width * 3,
               height: 350)
        .offset(y:-150)
    }
}

#Preview {
    HeaderView(title:"Register", subtitle:"Create an Account!", angle:-15, background:Color.blue)
}
