//
//  CameraView.swift
//  JourneyCam
//
//  Created by 徐满心 on 2023/8/23.
//

import SwiftUI

struct CameraView: View {
    var body: some View {
        ZStack {
            JourneyCamBg()
            Text("Camera")
        }
        .ignoresSafeArea()
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}
