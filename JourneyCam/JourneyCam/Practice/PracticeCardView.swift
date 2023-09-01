//
//  PracticeCardView.swift
//  JourneyCam
//
//  Created by 徐满心 on 2023/8/23.
//

import SwiftUI

struct PracticeCardView<Content: View>: View {
    var coverImage: String
    @ViewBuilder var pannelContent: Content
    var buttonAction: () -> Void
    
    var body: some View {
        ZStack {
            VStack {
                Image(coverImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Spacer()
            }
            VStack {
                Spacer()
                ZStack {
                    VisualEffectView(effect: UIBlurEffect(style: .dark))
                        .cornerRadius(20, corners: [.bottomLeft, .bottomRight])
                    Color(hex: 0xA5A6F6, alpha: 0.3)
                        .cornerRadius(20, corners: [.bottomLeft, .bottomRight])
                    pannelContent
                }
                .frame(height: 100)
            }
            StartPracticeButton(buttonAction: buttonAction)
                .offset(x: 103, y: 13)
        }
        .padding(.horizontal, 15)
        .frame(height: 287)
    }
}

struct StartPracticeButton: View {
    var buttonAction: () -> Void
    
    var body: some View {
        Button(action: {
            buttonAction()
        }) {
            ZStack {
                VisualEffectView(effect: UIBlurEffect(style: .dark))
                    .cornerRadius(32.9)
                Color(hex: 0x121212, alpha: 0.3)
                    .cornerRadius(32.9)
                RoundedRectangle(cornerRadius: 32.9)
                    .strokeBorder(.white, lineWidth: 1.1)
                Text("开始练习")
                    .font(.custom(Fonts.Roboto.bold.rawValue, size: 15))
                    .foregroundColor(.white)
            }
            .frame(width: 106.39, height: 34)
        }
    }
}
