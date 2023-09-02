//
//  PracticeCardView.swift
//  JourneyCam
//
//  Created by 毛凌骏 on 2023/8/28.
//

import SwiftUI

struct MyInfoCard<Content: View>: View {
    var headImage: String
    var logo1: String
    var logo2: String
    @ViewBuilder var pannelContent: Content
    var buttonAction: () -> Void
    
    var body: some View {
        ZStack {
            HStack {
                Image(headImage)
                    .frame(width: 80, height: 80)
                    .clipped()
                    .cornerRadius(40)
                    .offset(x: -10, y: 0)  
                VStack(alignment: .leading) {
                    Text("Alston-西瓜呆毛")
                        .font(.custom(Fonts.Roboto.bold.rawValue, size: 15))
                        .foregroundColor(.white)
                    HStack(alignment: .center) {
                        ZStack {
                            Rectangle()
                                .fill(Color(red:93/255,green:95/255,blue:239/255))
                                .cornerRadius(10)
                                .frame(width: 120, height: 20)

                            Text("Lv.7  资深摄影师")
                                .foregroundColor(.white)
                                .font(.custom(Fonts.Roboto.bold.rawValue, size: 12))
                        }
                        Image(logo1)
                            .frame(width: 20, height: 20)
                            .clipped()
                            .cornerRadius(10)
                        Image(logo2)
                            .frame(width: 20, height: 20)
                            .clipped()
                            .cornerRadius(10)
                    }

                }
            }.offset(x: -30, y: 0)
        }
        .padding(.horizontal, 15)
        .frame(width: 500, height: 250)
    }
}
