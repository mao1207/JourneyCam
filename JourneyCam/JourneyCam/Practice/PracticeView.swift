//
//  PracticeView.swift
//  JourneyCam
//
//  Created by 徐满心 on 2023/8/23.
//

import SwiftUI

struct PracticeView: View {
    @ObservedObject var viewModel = PracticeViewModel()
    
    var body: some View {
        ZStack {
            JourneyCamBg()
                .ignoresSafeArea()
            if viewModel.navigation == .Overview {
                ScrollView(.vertical) {
                    VStack {
                        PracticeCardView(
                            coverImage: "scene_depth_cover",
                            pannelContent: {
                                VStack(alignment: .leading) {
                                    HStack {
                                        FiveWordPracticeKnowledgeButton(text: "中景的概念") {
                                            withAnimation {
                                                viewModel.setNavigation(navigation: .Knowledge)
                                            }
                                        }
                                        FiveWordPracticeKnowledgeButton(text: "景深的作用") {
                                            
                                        }
                                    }
                                    HStack {
                                        SevenWordPracticeKnowledgeButton(text: "景深的影响因素") {
                                            
                                        }
                                        SevenWordPracticeKnowledgeButton(text: "景深效果的营造") {
                                            
                                        }
                                    }
                                }
                            },
                            buttonAction: {
                                Unity.shared.show()
                                Unity.shared.sendMessage(
                                    "SavedType",
                                    methodName: "InitializePractice",
                                    message: "SceneDepth")
                            }
                        )
                        .padding(.bottom, 20)
                        PracticeCardView(
                            coverImage: "scene_class_cover",
                            pannelContent: {
                                VStack(alignment: .leading) {
                                    HStack {
                                        ThreeWordPracticeKnowledgeButton(text: "曝光量") {
                                            
                                        }
                                        ThreeWordPracticeKnowledgeButton(text: "感光度") {
                                            
                                        }
                                    }
                                    HStack {
                                        ThreeWordPracticeKnowledgeButton(text: "低曝光") {
                                            
                                        }
                                        ThreeWordPracticeKnowledgeButton(text: "中曝光") {
                                            
                                        }
                                        ThreeWordPracticeKnowledgeButton(text: "高曝光") {
                                            
                                        }
                                    }
                                }
                            },
                            buttonAction: {
                                Unity.shared.show()
                                Unity.shared.sendMessage(
                                    "SavedType",
                                    methodName: "InitializePractice",
                                    message: "Exposure")
                            }
                        )
                        .padding(.bottom, 20)
                        PracticeCardView(
                            coverImage: "design_practice_cover",
                            pannelContent: {
                                VStack(alignment: .leading) {
                                    HStack {
                                        SevenWordPracticeKnowledgeButton(text: "构图法的重要性") {
                                            
                                        }
                                        FiveWordPracticeKnowledgeButton(text: "对角线构图") {
                                            
                                        }
                                    }
                                    HStack {
                                        FiveWordPracticeKnowledgeButton(text: "对称式构图") {

                                        }
                                        FiveWordPracticeKnowledgeButton(text: "九宫格构图") {

                                        }
                                    }
                                }
                            },
                            buttonAction: {
                                Unity.shared.show()
                                Unity.shared.sendMessage(
                                    "SavedType",
                                    methodName: "InitializePractice",
                                    message: "Design")
                            }
                        )
                        .padding(.bottom, 20)
                    }
                    .frame(maxWidth: .infinity)
                }
                .padding(.top, 20)
            }
            if viewModel.navigation == .Knowledge {
                PracticeKnowledgeView()
                    .environmentObject(viewModel)
            }
            if viewModel.navigation == .Result {
                PracticeResultView()
                    .environmentObject(viewModel)
            }
        }
    }
}

struct PracticeView_Previews: PreviewProvider {
    static var previews: some View {
        PracticeView()
    }
}
