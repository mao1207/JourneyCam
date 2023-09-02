//
//  PracticeCardView.swift
//  JourneyCam
//
//  Created by 梁馨 on 2023/8/28.
//

import SwiftUI

struct PersonCard<Content: View>: View {
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
                Text("这几天尝试了一下新的拍照风格")
                    .font(.custom(Fonts.Roboto.bold.rawValue, size: 15))
                    .foregroundColor(.white)
                    .frame(width: 260)

                Text("这段时间做了一些大胆的尝试，总结来说就以下几点，一是更加注重人物本身的动作与神态，二是尝试...全文")
                    .font(.custom(Fonts.Roboto.bold.rawValue, size: 12))
                    .foregroundColor(Color(red:137/255,green:137/255,blue:137/255))
                    .frame(width: 290)
                    .padding(.leading, 30)
                    .padding(.top, 10)

                HStack {
                    Image(card1)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 360, height: 175)
                        .clipped()
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
            }
            .frame(width: 360, height: 326)
            .background(Color(red:165/255,green:166/255,blue:246/255).opacity(0.3))
            .cornerRadius(20)
            .shadow(radius: 10)
            .padding(.top)
        }

    
}


