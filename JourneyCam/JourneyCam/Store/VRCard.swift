//
//  TodayClass.swift
//  JourneyCam
//
//  Created by normal on 2023/8/29.
//

import SwiftUI

struct VRCard<Content: View>: View {
    var card: String
    @ViewBuilder var pannelContent: Content
    @State private var showFullText: Bool = false

    var buttonAction: () -> Void
    

    var body: some View {
            HStack {
                Image(card)
                    .frame(width: 150, height: 250)
                    .clipped()
                    .cornerRadius(15)
                    .offset(x: -20, y: 0)
                VStack(alignment: .leading) {
                    Text("VR场景：雨夜")
                        .foregroundColor(.white)
                        .font(.custom(Fonts.Roboto.bold.rawValue, size: 20))
                        .offset(x: 20, y: -20)
                    Text("制作者：Marijn Mao")
                        .foregroundColor(Color(red:147/255,green:147/255,blue:147/255))
                        .font(.custom(Fonts.Roboto.bold.rawValue, size: 12))
                        .offset(x: 20, y: -20)
                    Text("该VR全景视频拍摄于香港的雨夜，您可以360度旋转手机查看周围的风景并选择任意场景为切入点拍照，比如遮伞的行人、雨夜的灯光，用您的灵感来拍摄...全文")
                        .foregroundColor(Color(red:147/255,green:147/255,blue:147/255))
                        .font(.custom(Fonts.Roboto.bold.rawValue, size: 12))
                        .offset(x: 10, y: 0)
                        .frame(width: 150)
                }
                .offset(x: -15, y: 0)

            }
            .frame(width: 345, height: 250)
            .background(Color(red:165/255,green:166/255,blue:246/255).opacity(0.3))
            .cornerRadius(15)
            .shadow(radius: 10)
            .padding(.top)
        }

    
}
