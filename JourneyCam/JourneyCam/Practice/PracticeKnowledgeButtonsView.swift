//
//  PracticeKnowledgeButtonsView.swift
//  JourneyCam
//
//  Created by 徐满心 on 2023/8/24.
//

import SwiftUI

struct TwoWordPracticeKnowledgeButton: View {
    var text: String
    var buttonAction: () -> Void
    
    var body: some View {
        Button(action: buttonAction) {
            ZStack {
                Color(hex: 0x090514, alpha: 0.3)
                    .cornerRadius(26.11)
                Text(text)
                    .font(.custom(Fonts.SourceHanSansCN.medium.rawValue, size: 12))
                    .foregroundColor(Color(hex: 0xFFFFFF, alpha: 0.7))
            }
            .frame(width: 59, height: 28)
        }
    }
}

struct ThreeWordPracticeKnowledgeButton: View {
    var text: String
    var buttonAction: () -> Void
    
    var body: some View {
        Button(action: buttonAction) {
            ZStack {
                Color(hex: 0x090514, alpha: 0.3)
                    .cornerRadius(26.11)
                Text(text)
                    .font(.custom(Fonts.SourceHanSansCN.medium.rawValue, size: 12))
                    .foregroundColor(Color(hex: 0xFFFFFF, alpha: 0.7))
            }
            .frame(width: 74, height: 28)
        }
    }
}

struct FiveWordPracticeKnowledgeButton: View {
    var text: String
    var buttonAction: () -> Void
    
    var body: some View {
        Button(action: buttonAction) {
            ZStack {
                Color(hex: 0x090514, alpha: 0.3)
                    .cornerRadius(26.11)
                Text(text)
                    .font(.custom(Fonts.SourceHanSansCN.medium.rawValue, size: 12))
                    .foregroundColor(Color(hex: 0xFFFFFF, alpha: 0.7))
            }
            .frame(width: 107, height: 28)
        }
    }
}

struct SevenWordPracticeKnowledgeButton: View {
    var text: String
    var buttonAction: () -> Void
    
    var body: some View {
        Button(action: buttonAction) {
            ZStack {
                Color(hex: 0x090514, alpha: 0.3)
                    .cornerRadius(26.11)
                Text(text)
                    .font(.custom(Fonts.SourceHanSansCN.medium.rawValue, size: 12))
                    .foregroundColor(Color(hex: 0xFFFFFF, alpha: 0.7))
            }
            .frame(width: 134, height: 28)
        }
    }
}
