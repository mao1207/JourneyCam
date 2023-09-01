//
//  PracticeResultView.swift
//  JourneyCam
//
//  Created by 徐满心 on 2023/8/31.
//

import SwiftUI

struct PracticeResultView: View {
    @EnvironmentObject var practiceViewModel: PracticeViewModel
    
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    Button(action: {
                        withAnimation {
                            practiceViewModel.setNavigation(navigation: .Overview)
                        }
                    }) {
                        Image("purple_back_button")
                    }
                    Spacer()
                }
                HStack {
                    Spacer()
                    Text("练习成果")
                        .font(.custom(Fonts.Roboto.bold.rawValue, size: 16))
                    Spacer()
                }
            }
            .padding(.horizontal, 28)
            .padding(.top, 10)
            ScrollView {
                VStack {
                    ZStack {
                        HStack {
                            Spacer()
                            Color(hex: 0xA5A6F6, alpha: 0.3)
                                .frame(width: 281, height: 89)
                                .cornerRadius(60, corners: [.topRight, .bottomRight])
                        }
                        HStack {
                            ZStack {
                                Circle()
                                    .foregroundColor(Color(hex: 0xEDE4FF))
                                    .frame(width: 90, height: 90)
                                Pie(startAngle: Angle.degrees(-90), endAngle: Angle.degrees(180), clockwise: false)
                                    .foregroundColor(Color(hex: 0xA076F9))
                                    .frame(width: 90, height: 90)
                                Circle()
                                    .foregroundColor(Color(hex: 0x463D72))
                                    .frame(width: 70, height: 70)
                                Text("84")
                                    .font(.custom(Fonts.Avenir.heavy.rawValue, size: 28))
                                    .offset(y: -5)
                                Text("综合评价")
                                    .font(.custom(Fonts.SourceHanSansCN.medium.rawValue, size: 8.5))
                                    .offset(y: 18)
                            }
                            Spacer()
                            Text("做得太棒了！威廉骑士终于得到了他想要的照片，但他觉得如果镜头再向下转一点就好了")
                                .frame(width: 190, height: 63)
                                .font(.custom(Fonts.SourceHanSansCN.medium.rawValue, size: 12))
                                .lineSpacing(5)
                                .padding(.trailing, 23)
                        }
                        .padding(.leading, 26)
                    }
                    .padding(.trailing, 25)
                    .padding(.top, 20)
                    HStack {
                        if let image = practiceViewModel.capturedImage {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFit()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 170)
                                .cornerRadius(10)
                        }
                        Spacer()
                        HStack {
                            Spacer()
                            VStack {
                                Group {
                                    PracticeScoreBar(type: "构图", score: 75)
                                    PracticeScoreBar(type: "光影", score: 84)
                                    PracticeScoreBar(type: "创意", score: 90)
                                    PracticeScoreBar(type: "风格", score: 87)
                                }
                                .padding(.bottom)
                                HStack {
                                    Image("back_to_practice_button")
                                    Image("download_button")
                                    Image("share_button")
                                }
                            }
                        }
                        .padding(.top, 10)
                        .frame(width: 160)
                    }
                    .padding(.top, 20)
                    .padding(.leading, 20)
                    HStack {
                        Image("reference_work")
                        Spacer()
                    }
                    .padding(.top, 20)
                    HStack {
                        Group {
                            Image("standard_answer_1")
                                .resizable()
                                .scaledToFit()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100)
                                .cornerRadius(5)
                            Image("standard_answer_2")
                                .resizable()
                                .scaledToFit()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100)
                                .cornerRadius(5)
                            Image("standard_answer_3")
                                .resizable()
                                .scaledToFit()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100)
                                .cornerRadius(5)
                        }
                        .padding(.horizontal, 5)
                    }
                    .padding(.top, 10)
                    Spacer()
                }
                .padding(.top, 5)
            }
        }
    }
}

struct PracticeResultView_Previews: PreviewProvider {
    static var previews: some View {
        PracticeResultView()
    }
}
