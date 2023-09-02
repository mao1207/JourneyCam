//
//  PracticeCardView.swift
//  JourneyCam
//
//  Created by 梁馨 on 2023/8/28.
//

import SwiftUI

struct Forum<Content: View>: View {
    var headImage: String
    var logo1: String
    var logo2: String
    var card1: String
    var icon_heart_ :String
    var icon_download_ : String
    var icon_share_android_ :String
    var icon_chat_lines_ : String 
    @ViewBuilder var pannelContent: Content
    @State private var showFullText: Bool = false

    var buttonAction: () -> Void
    

    var body: some View {
            VStack(alignment: .leading) {
                ZStack {
                    HStack {
                        Image(headImage)
                            .frame(width: 50, height: 50)
                            .clipped()
                            .cornerRadius(25)
                            .offset(x: -10, y: 0)
                        VStack(alignment: .leading) {
                            HStack(alignment: .center) {
                                Text("Alston-西瓜呆毛")
                                    .font(.custom(Fonts.Roboto.bold.rawValue, size: 15))
                                    .foregroundColor(.white.opacity(0.8))
                                Image(logo1)
                                    .frame(width: 20, height: 20)
                                    .clipped()
                                    .cornerRadius(10)
                                Image(logo2)
                                    .frame(width: 20, height: 20)
                                    .clipped()
                                    .cornerRadius(10)
                            }
                            Text("资深摄影师   IP属地：浙江")
                                .foregroundColor(Color(red:147/255,green:147/255,blue:147/255))
                                .font(.custom(Fonts.Roboto.bold.rawValue, size: 12))

                        }
                        ZStack {
                            Rectangle()
                                .fill(Color(red:160/255,green:118/255,blue:249/255))
                                .cornerRadius(20)
                                .frame(width: 60, height: 25)

                            Text("关注")
                                .foregroundColor(.white)
                                .font(.custom(Fonts.Roboto.bold.rawValue, size: 12))
                        }.offset(x: 10, y: 0)
                    }
                }
                .padding(.horizontal, 15)
                .frame(width: 500, height: 250)
                Text("这几天尝试了一下新的拍照风格")
                    .font(.custom(Fonts.Roboto.bold.rawValue, size: 15))
                    .foregroundColor(.white)
                    .frame(width: 260)
                    .offset(x: 80, y: -80)

                Text("这段时间做了一些大胆的尝试，总结来说就以下几点，一是更加注重人物本身的动作与神态，二是尝试...全文")
                    .font(.custom(Fonts.Roboto.bold.rawValue, size: 12))
                    .foregroundColor(Color(red:137/255,green:137/255,blue:137/255))
                    .frame(width: 290, height: 35)
                    .padding(.leading, 30)
                    .padding(.top, 10)
                    .offset(x: 70, y: -90)

                HStack {
                    Image(card1)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 360, height: 175)
                        .clipped()
                        .offset(x: 70, y: -85)
                }
                HStack {
                    Image(icon_heart_)
                        .frame(width: 17, height: 17)
                        .clipped()
                    Text("8964")
                        .font(.custom(Fonts.Roboto.bold.rawValue, size: 12))
                        .foregroundColor(Color(red:137/255,green:137/255,blue:137/255))
                    Image(icon_chat_lines_)
                        .frame(width: 17, height: 17)
                    Text("125")
                        .font(.custom(Fonts.Roboto.bold.rawValue, size: 12))
                        .foregroundColor(Color(red:137/255,green:137/255,blue:137/255))
                        .clipped()
                    Image(icon_download_)
                        .frame(width: 17, height: 17)
                        .clipped()
                    Text("1101")
                        .font(.custom(Fonts.Roboto.bold.rawValue, size: 12))
                        .foregroundColor(Color(red:137/255,green:137/255,blue:137/255))
                    Image(icon_share_android_)
                        .frame(width: 17, height: 17)
                        .clipped()
                    Text("8964")
                        .font(.custom(Fonts.Roboto.bold.rawValue, size: 12))
                        .foregroundColor(Color(red:137/255,green:137/255,blue:137/255))
                }
                .padding(.leading, 20)
                .padding(.top, 10)
                .offset(x: 70, y: -85)
            }
            .frame(width: 360, height: 400)
            .background(Color(red:165/255,green:166/255,blue:246/255).opacity(0.3))
            .cornerRadius(20)
            .shadow(radius: 10)
            .padding(.top)
        }

    
}


