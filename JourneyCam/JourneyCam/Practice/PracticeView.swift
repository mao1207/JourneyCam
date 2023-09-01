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
                            coverImage: "scene_class_cover",
                            pannelContent: {
                                VStack(alignment: .leading) {
                                    HStack {
                                        ThreeWordPracticeKnowledgeButton(text: "大远景") {
                                            
                                        }
                                        TwoWordPracticeKnowledgeButton(text: "远景") {
                                            
                                        }
                                        TwoWordPracticeKnowledgeButton(text: "中景") {
                                            
                                        }
                                        TwoWordPracticeKnowledgeButton(text: "近景") {
                                            
                                        }
                                    }
                                    HStack {
                                        ThreeWordPracticeKnowledgeButton(text: "中近景") {
                                            
                                        }
                                        TwoWordPracticeKnowledgeButton(text: "全景") {
                                            
                                        }
                                        TwoWordPracticeKnowledgeButton(text: "特写") {
                                            
                                        }
                                        ThreeWordPracticeKnowledgeButton(text: "大特写") {
                                            
                                        }
                                    }
                                }
                            },
                            buttonAction: {
                                
                            }
                        )
                        .padding(.bottom, 20)
                        PracticeCardView(
                            coverImage: "scene_depth_cover",
                            pannelContent: {
                                VStack(alignment: .leading) {
                                    HStack {
                                        FiveWordPracticeKnowledgeButton(text: "景深的概念") {
                                            withAnimation {
                                                viewModel.setNavigation(navigation: .Result)
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
                                    "Canvas",
                                    methodName: "InitializePractice",
                                    message: "SceneDepth")
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
