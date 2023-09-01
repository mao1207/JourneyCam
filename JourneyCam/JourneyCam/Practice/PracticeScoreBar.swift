//
//  PracticeScoreBar.swift
//  JourneyCam
//
//  Created by 徐满心 on 2023/8/31.
//

import SwiftUI

struct PracticeScoreBar: View {
    let type: String
    let score: Int
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color(hex: 0xA076F9), Color(hex: 0xD7BBF5)], startPoint: .leading, endPoint: .trailing)
                .cornerRadius(30, corners: [.topLeft, .bottomLeft])
            subTrapezoid
            HStack {
                Text(type)
                    .font(.custom(Fonts.SourceHanSansCN.bold.rawValue, size: 14))
                    .padding(.leading, 20)
                Text(String(score))
                    .font(.custom(Fonts.Avenir.heavy.rawValue, size: 14))
                    .padding(.leading, 10)
                Spacer()
            }
        }
        .frame(width: 150, height: 30)
    }
    
    var trapezoidWidth: CGFloat {
        10.0 + (110.0/100.0) * (100.0-CGFloat(score))
    }
    
    var subTrapezoid: some View {
        return HStack {
            Spacer()
            Trapezoid()
                .frame(width: trapezoidWidth, height: 30)
                .foregroundColor(Color(hex: 0x44404D))
        }
    }
}
