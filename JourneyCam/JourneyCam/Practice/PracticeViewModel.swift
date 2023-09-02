//
//  PracticeViewModel.swift
//  JourneyCam
//
//  Created by 徐满心 on 2023/8/31.
//

import SwiftUI
import UnityFramework

class PracticeViewModel: NSObject, ObservableObject, NativeCallsProtocol {
    
    @Published public var practiceModel = PracticeModel();
    
    override init() {
        super.init()
        
        NSClassFromString("FrameworkLibAPI")?.registerAPIforNativeCalls(self)
    }
    
    func sendMessage(toMobileApp message: String) {
        var tuple = analyze(message: message)
        var type = tuple.0
        switch(type) {
        case "photo": do {
            practiceModel.imageString = tuple.1
            withAnimation {
                practiceModel.practiceViewNavigation = .Result
            }
            break
        }
        case "clearOverview": do {
            practiceModel.practiceViewNavigation = .None
        }
        case "resetOverview": do {
            withAnimation {
                practiceModel.practiceViewNavigation = .Overview
            }
        }
        case "overallScore": do {
            practiceModel.overallScore = Int(tuple.1) ?? nil
        }
        case "score1": do {
            practiceModel.Score1 = Int(tuple.1) ?? nil
        }
        case "score2": do {
            practiceModel.Score2 = Int(tuple.1) ?? nil
        }
        case "score3": do {
            practiceModel.Score3 = Int(tuple.1) ?? nil
        }
        case "score4": do {
            practiceModel.Score4 = Int(tuple.1) ?? nil
        }
        default: do {
            
        }
        }
    }
    
    func convertBase64ToImage(base64String: String) -> UIImage? {
        if let data = Data(base64Encoded: base64String) {
            return UIImage(data: data)
        }
        return nil
    }
    
    var capturedImage: UIImage? {
        if let imageString = practiceModel.imageString {
            return convertBase64ToImage(base64String: imageString)
        }
        return nil
    }
    
    var navigation: PracticeViewNavigation {
        practiceModel.practiceViewNavigation
    }
    
    func setNavigation(navigation: PracticeViewNavigation) {
        practiceModel.practiceViewNavigation = navigation
    }
    
    private func analyze(message: String) -> (String, String) {
        let firstIndex =  message.firstIndex(of: ":")
        let type = message[message.startIndex..<firstIndex!]
        let content = message[message.index(firstIndex!, offsetBy: 1)..<message.endIndex]
        return (String(type), String(content))
    }
    
    func getCourageString() -> String
    {
        if practiceModel.practiceType == "SceneDepth" {
            return "做得太棒了！威廉骑士终于得到了他想要的照片，但他觉得如果镜头再向下转一点就好了"
        } else if practiceModel.practiceType == "Exposure" {
            return "做得太棒了！你拍出了独一无二的宇宙中的地球，但如果再提高一下白平衡就更好了"
        } else if practiceModel.practiceType == "Design" {
            return "做得太棒了！你成功使用对角线构图法拍出了房间的空间感"
        } else {
            return ""
        }
    }
}
