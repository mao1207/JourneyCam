//
//  PracticeCardView.swift
//  JourneyCam
//
//  Created by 毛凌骏 on 2023/8/28.
//

import SwiftUI

struct StoreTab<Content: View>: View {
    @ViewBuilder var pannelContent: Content
    var buttonAction: () -> Void
    
    var body: some View {
        HStack {
            VStack {
                Text("论坛")
                    .foregroundColor(.white)
                    .font(.custom(Fonts.Roboto.bold.rawValue, size: 14))
                Rectangle()
                    .fill(Color(red:160/255,green:118/255,blue:249/255))
                    .frame(width: 150, height: 1)
            }
            VStack {
                Text("VR创作")
                    .foregroundColor(.white)
                    .font(.custom(Fonts.Roboto.bold.rawValue, size: 14))
                Rectangle()
                    .fill(Color(red:183/255,green:183/255,blue:183/255))
                    .frame(width: 150, height: 1)
            }
        }
    }
}
