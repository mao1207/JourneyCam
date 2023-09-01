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
            Text("Me")
        }
        .ignoresSafeArea()
    }
}

struct MeView_Previews: PreviewProvider {
    static var previews: some View {
        MeView()
    }
}
