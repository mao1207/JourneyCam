//
//  DynamicCardView.swift
//  JourneyCam
//
//  Created by normal on 2023/8/28.
//

import SwiftUI

struct DynamicCardView: View {
    var imageName: String
    
    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 280, height: 300)
            .clipped()
            .cornerRadius(10)
        .padding()
    }
}
