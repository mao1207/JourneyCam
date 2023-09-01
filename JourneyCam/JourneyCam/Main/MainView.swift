//
//  MainView.swift
//  JourneyCam
//
//  Created by 徐满心 on 2023/8/20.
//

import SwiftUI

struct MainView: View {
    @State var selectedTab = 2
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(Color(hex: 0x211F2F))
    }
    
    var body: some View {
        TabView(selection:$selectedTab) {
            HomeView()
                .tabItem {
                    if selectedTab == 0 {
                        Image("home_active_ic")
                    } else {
                        Image("home_inactive_ic")
                    }
                }
                .tag(0)
            CameraView()
                .tabItem {
                    if selectedTab == 1 {
                        Image("camera_active_ic")
                    } else {
                        Image("camera_inactive_ic")
                    }
                }
                .tag(1)
            PracticeView()
                .tabItem {
                    if selectedTab == 2 {
                        Image("practice_active_ic")
                    } else {
                        Image("practice_inactive_ic")
                    }
                }
                .tag(2)
            StoreView()
                .tabItem {
                    if selectedTab == 3 {
                        Image("store_active_ic")
                    } else {
                        Image("store_inactive_ic")
                    }
                }
                .tag(3)
            MeView()
                .tabItem {
                    if selectedTab == 4 {
                        Image("me_active_ic")
                    } else {
                        Image("me_inactive_ic")
                    }
                }
                .tag(4)
        }
        .ignoresSafeArea()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
