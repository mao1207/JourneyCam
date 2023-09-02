//
//  PracticeCardView.swift
//  JourneyCam
//
//  Created by 梁馨 on 2023/8/28.
//

import SwiftUI

struct CourseInfoCard<Content: View>: View {
    
    @ViewBuilder var pannelContent: Content
    @State private var showFullText: Bool = false
    
    var buttonAction: () -> Void
    var subtitle: String
    var largeContent: String

    var body: some View {
        VStack(alignment: .leading ) {
            Spacer()
            Text(subtitle)
                .font(.custom(Fonts.Roboto.bold.rawValue,size : 14))
                .foregroundColor(.white)
                .padding(.top)
            Divider()
                .rotationEffect(.degrees(90))
                .background(Color.white)
                .frame(height:20)
                .padding(.leading,20)
                .padding(.trailing,20)
            Text(largeContent)
                .font(.custom(Fonts.Roboto.bold.rawValue,size : 12))
                .foregroundColor(.white)
                .frame(width: 320)
                .padding(.leading)
           
            Spacer()
            }
            .frame(width: 360)
            .padding(.horizontal)
            .background(Color(red:98/255,green:97/255,blue:142/255).opacity(0.3))
            .cornerRadius(20)
            .shadow(radius: 10)
            .padding(.top)
        
        }

    
}
