//
//  TodayClass.swift
//  JourneyCam
//
//  Created by 梁馨 on 2023/8/29.
//

import SwiftUI

struct CourseHeader<Content: View>: View {
    var left: String
    @ViewBuilder var pannelContent: Content
    @State private var showFullText: Bool = false
    @EnvironmentObject var practiceViewModel: PracticeViewModel

    var buttonAction: () -> Void
    

    var body: some View {
            HStack {
                Image(left)
                    .frame(width: 150, height: 250)
                    .clipped()
                    .cornerRadius(15)
                    .offset(x: 0, y: 0)
                    .onTapGesture {
                        withAnimation {
                            practiceViewModel.setNavigation(navigation: .Overview)
                        }
                    }
                Text("中景")
                    .foregroundColor(.white)
                    .font(.custom(Fonts.Roboto.bold.rawValue, size: 20))
                    .offset(x: 22, y: 0)
            }
            .frame(width: 345)
            .padding(.top)
        }

    
}
