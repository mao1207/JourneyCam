//
//  PracticeCardView.swift
//  JourneyCam
//
//  Created by 毛凌骏，梁馨 on 2023/8/28.
//

import SwiftUI

struct ButtonArea<Content: View>: View {
    var button1: String
    var button2: String
    var button3: String
    var button4: String
    @ViewBuilder var pannelContent: Content
    var buttonAction: () -> Void
    
    var body: some View {
        ZStack {
            HStack {
                VStack {
                    Image(button1)
                        .frame(width: 50, height: 50)
                        .clipped()
                    Text("我的创作")
                        .font(.custom(Fonts.Roboto.bold.rawValue, size: 15))
                        .foregroundColor(.white)
                }
                Spacer()
                VStack {
                    Image(button2)
                        .frame(width: 50, height: 50)
                        .clipped()
                    Text("我的收藏")
                        .font(.custom(Fonts.Roboto.bold.rawValue, size: 15))
                        .foregroundColor(.white)
                }
                Spacer()
                VStack {
                    Image(button3)
                        .frame(width: 50, height: 50)
                        .clipped()
                    Text("我的关注")
                        .font(.custom(Fonts.Roboto.bold.rawValue, size: 15))
                        .foregroundColor(.white)
                }
                Spacer()
                VStack {
                    Image(button4)
                        .frame(width: 50, height: 50)
                        .clipped()
                    Text("我的浏览")
                        .font(.custom(Fonts.Roboto.bold.rawValue, size: 15))
                        .foregroundColor(.white)
                }
            }
        }
        .padding(.horizontal, 15)
        .frame(width: 400, height: 0)
        
    }
}
