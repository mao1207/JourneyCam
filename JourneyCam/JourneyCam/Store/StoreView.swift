//
//  MeView.swift
//  JourneyCam
//
//  Created by 徐满心 on 2023/8/23.
//

import SwiftUI

struct StoreView: View {
    let mode = 1
    var body: some View {
        ZStack {
            JourneyCamBg()
            VStack {
                StoreTab(
                    pannelContent: {},
                    buttonAction: {}
                ).offset(x: 0, y: 60)
                ScrollView(.vertical) {
                    Forum(
                        headImage: "Head",
                        logo1: "logo1",
                        logo2: "logo2",
                        card1: "card1",
                        icon_heart_ : "icon_heart_",
                        icon_download_ : "icon_download_",
                        icon_share_android_: "icon_share_android_",
                        icon_chat_lines_ : "icon_chat_lines_",
                        pannelContent: {},
                        buttonAction: {

                        }
                    )
                    Forum(
                        headImage: "Head",
                        logo1: "logo1",
                        logo2: "logo2",
                        card1: "card1",
                        icon_heart_ : "icon_heart_",
                        icon_download_ : "icon_download_",
                        icon_share_android_: "icon_share_android_",
                        icon_chat_lines_ : "icon_chat_lines_",
                        pannelContent: {},
                        buttonAction: {

                        }
                    )
                }.offset(x: 0, y: 70)
            }
        }
        .ignoresSafeArea()
    }
}

//struct StoreView: View {
//    var body: some View {
//        ZStack {
//            JourneyCamBg()
//            VStack {
//                StoreTab(
//                    pannelContent: {},
//                    buttonAction: {}
//                ).offset(x: 0, y: 60)
//                ScrollView(.vertical) {
//                    VRCard(
//                        card: "VR1",
//                        pannelContent: {},
//                        buttonAction: {
//
//                        }
//                    )
//                    VRCard(
//                        card: "VR1",
//                        pannelContent: {},
//                        buttonAction: {
//
//                        }
//                    )
//                    VRCard(
//                        card: "VR1",
//                        pannelContent: {},
//                        buttonAction: {
//
//                        }
//                    )a
//                }.offset(x: 0, y: 80)
//            }
//        }
//        .ignoresSafeArea()
//    }
//}

struct StoreView_Previews: PreviewProvider {
    static var previews: some View {
        StoreView()
    }
}
