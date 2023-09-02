//
//  PracticeKnowledgeView.swift
//  JourneyCam
//
//  Created by 徐满心 on 2023/8/31.
//

import SwiftUI

struct PracticeKnowledgeView: View {
    @EnvironmentObject var practiceViewModel: PracticeViewModel
    
    var body: some View {
        Course()
    }
}

struct PracticeKnowledgeView_Previews: PreviewProvider {
    static var previews: some View {
        PracticeKnowledgeView()
    }
}
