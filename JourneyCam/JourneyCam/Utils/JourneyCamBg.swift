//
//  JourneyCamBg.swift
//  JourneyCam
//
//  Created by 徐满心 on 2023/8/23.
//

import SwiftUI

struct JourneyCamBg: View {
    var body: some View {
        ZStack {
            Color(.black)
            VStack {
                Image("main_top_bg")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Spacer()
            }
        }
    }
}

struct JourneyCamBg_Previews: PreviewProvider {
    static var previews: some View {
        JourneyCamBg()
    }
}
