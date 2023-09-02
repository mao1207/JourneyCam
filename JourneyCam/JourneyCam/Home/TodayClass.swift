//
//  TodayClass.swift
//  JourneyCam
//
//  Created by normal on 2023/8/29.
//

import SwiftUI

struct TodayClass<Content: View>: View {
    var card: String
    @ViewBuilder var pannelContent: Content
    @State private var showFullText: Bool = false

    var buttonAction: () -> Void
    

    var body: some View {
            HStack {
                Image(card)
                    .frame(width: 135, height: 100)
                    .clipped()
                    .cornerRadius(15)
                    .offset(x: -30, y: 0)
                VStack(alignment: .leading) {
                    Text("拍摄人物的7个小tips")
                        .foregroundColor(.white)
                        .font(.custom(Fonts.Roboto.bold.rawValue, size: 14))
                    Text("#人物  #构图")
                        .foregroundColor(.white)
                        .font(.custom(Fonts.Roboto.bold.rawValue, size: 12))
                    ZStack(alignment: .center) {
                        Rectangle()
                            .fill(Color(red:101/255,green:40/255,blue:247/255))
                            .cornerRadius(30)
                            .frame(width: 77, height: 25)
                            .padding(.leading)
                        Text("报名参与")
                            .foregroundColor(.white)
                            .font(.custom(Fonts.Roboto.bold.rawValue, size: 12))
                            .offset(x: 8, y: 0)
                        
                    }
                    .offset(x: 50, y: 5)  
                }
                .offset(x: -15, y: 0)

            }
            .frame(width: 330, height: 100)
            .background(Color(red:165/255,green:166/255,blue:246/255).opacity(0.3))
            .cornerRadius(15)
            .shadow(radius: 10)
            .padding(.top)
        }

    
}
