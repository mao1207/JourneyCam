//
//  HomeView.swift
//  JourneyCam
//
//  Created by 徐满心 on 2023/8/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            JourneyCamBg()
            VStack {
                SearchBar()
                ButtonArea(
                    button1: "color_teaching",
                    button2: "light_shadow_teaching",
                    button3: "design_picture_teaching",
                    button4: "angle_teaching",
                    pannelContent: {},
                    buttonAction: {
                        
                    }
                ).offset(x: 0, y: -100)
                DynamicCardView (
                    imageName: "class1"
                ).offset(x: 0, y: -50)
                ZStack (){
                    Rectangle()
                        .fill(Color(red:160/255,green:118/255,blue:249/255))
                        .cornerRadius(20)
                        .frame(width: 220, height: 30)
                        .padding(.leading)

                    Text("今日公开课")
                        .foregroundColor(.white)
                        .font(.custom(Fonts.Roboto.bold.rawValue, size: 16))
                        .offset(x: 30, y: 0)
                }
                .frame(width: 400, height: 120)
                .offset(x: -150, y: -70)
                TodayClass(
                    card: "today1",
                    pannelContent: {},
                    buttonAction: {
                    
                    }
                )
                .offset(x: 0, y: -120)
            }
        }
        .ignoresSafeArea()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
