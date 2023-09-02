//
//  Course.swift
//  JourneyCam
//
//  Created by 梁馨 on 2023/8/31.
//

import SwiftUI

struct Course: View {
    var body: some View {
        ZStack {
            JourneyCamBg()
            VStack {
              
                ScrollView(.vertical) {
                    CourseHeader(
                        left: "left_arrow",
                        pannelContent: {},
                        buttonAction: {

                        }
                    )
                    .offset(x: -130, y: 100)
                    CourseInfoCard(
                        pannelContent: {},
                        buttonAction: {
                        },
                        subtitle : "     中景的概念",
                        largeContent : "中景是一种展现场景局部或人物膝盖以上部分的景别。"
                    )
//                    .offset( y: -160)
                   
                    CourseInfoCard(
                        pannelContent: {},
                        buttonAction: {
                        },
                        subtitle : "     中景的作用",
                        largeContent : "    中景画面中人物整体形象和环境空间降至次要位置，更重视具体的动作和情节。有利于交代人与人、人与物体之间的关系。中景画面常常被用作叙事性的描述。"
                    )
                    ImgCard(
                        pannelContent: {},
                            
                        buttonAction: {},
                        image: Image("middleCam"),
                        descriptionText: "图片例证：电影《巴顿将军》\n导演运用中景镜头展现了人物所处的局部空间环境，重点在于表现巴顿将军在讲话中左右来回走动以及他不断的手势与动作。"
                    )
                    ImgCard(
                        pannelContent: {},
                            
                        buttonAction: {},
                        image: Image("Sence"),
                        descriptionText: "图片例证：电影《理智与情感》\n导演运用中景镜头展现一个室内的局部环境，凸显房屋主人的爱好与性格，其次通过中景镜头表现三人的站位、关系以及对话中的动作。"
                    )
                    
                }
                .zIndex(1)
                    .offset( y: -160)
            }
        }
        .ignoresSafeArea()
        
    }
}

struct Course_Previews: PreviewProvider {
    static var previews: some View {
        Course()
    }
}

