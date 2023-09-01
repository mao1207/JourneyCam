//
//  StoreView.swift
//  JourneyCam
//
//  Created by 徐满心 on 2023/8/23.
//

import SwiftUI

struct StoreView: View {
    var body: some View {
        ZStack {
            JourneyCamBg()
            Text("Store")
        }
        .ignoresSafeArea()
    }
}

struct StoreView_Previews: PreviewProvider {
    static var previews: some View {
        StoreView()
    }
}
