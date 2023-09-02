//
//  ImgCard.swift
//  JourneyCam
//
//  Created by 梁馨 on 2023/9/2.
//

import SwiftUI


struct ImgCard<Content: View>: View {
   
    @ViewBuilder var pannelContent: Content
    @State private var showFullText: Bool = false

    var buttonAction: () -> Void
    var image: Image
    var descriptionText: String

    var body: some View {
        VStack(spacing: 10){
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 320)
                .cornerRadius(10)
                .clipped()
                .padding(.top)
                .padding(.horizontal)
                
            Text(descriptionText)
                .font(.caption)
                .foregroundColor(.gray)
                .lineLimit(nil)
                .frame(width: 360,alignment: .center)
                .padding(.leading,20)
            Spacer()
            
        }
        .frame(width:400)
        
        .background(Color(red:165/255,green:166/255,blue:246/255).opacity(0.3))
        .cornerRadius(20)
        .shadow(radius: 10)
        .padding(.top)
        
    }

    
}

