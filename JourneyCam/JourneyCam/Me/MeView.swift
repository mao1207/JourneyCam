//
//  MeView.swift
//  JourneyCam
//
//  Created by 徐满心 on 2023/8/23.
//

import SwiftUI

struct MeView: View {
    var body: some View {
        ZStack {
            JourneyCamBg()
            ScrollView(.vertical) {
                VStack {
                    MyInfoCard(
                        headImage: "Head",
                        logo1: "logo1",
                        logo2: "logo2",
                        pannelContent: {},
                        buttonAction: {
                            
                        }
                    )
                    ButtonArea(
                        button1: "button1",
                        button2: "button2",
                        button3: "button3",
                        button4: "button4",
                        pannelContent: {},
                        buttonAction: {
                            
                        }
                    )
                    ZStack (){
                        Rectangle()
                            .fill(Color(red:160/255,green:118/255,blue:249/255))
                            .cornerRadius(20)
                            .frame(width: 220, height: 30)
                            .padding(.leading)

                        Text("最近发布")
                            .foregroundColor(.white)
                            .font(.custom(Fonts.Roboto.bold.rawValue, size: 16))
                            .offset(x: 20, y: 0)
                    }
                    .frame(width: 400, height: 120)
                    .offset(x: -150, y: 30)
                    PersonCard(
                        card1: "card1",
                        icon_heart_ : "icon_heart_",
                        icon_download_ : "icon_download_",
                        icon_share_android_: "icon_share_android_",
                        icon_chat_lines_ : "icon_chat_lines_",
                        pannelContent: {},
                        buttonAction: {
                        
                        }
                    )
                    PersonCard(
                        card1: "card1",
                        icon_heart_ : "icon_heart_",
                        icon_download_ : "icon_download_",
                        icon_share_android_: "icon_share_android_",
                        icon_chat_lines_ : "icon_chat_lines_",
                        pannelContent: {},
                        buttonAction: {
                        
                        }
                    )
                }
            }
            
        }
        .ignoresSafeArea()
    }
}

struct MeView_Previews: PreviewProvider {
    static var previews: some View {
        MeView()
    }
}
