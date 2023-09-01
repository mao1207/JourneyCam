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
            Text("Home")
        }
        .ignoresSafeArea()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
