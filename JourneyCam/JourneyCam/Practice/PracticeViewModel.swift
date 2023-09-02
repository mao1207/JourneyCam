//
//  PracticeViewModel.swift
//  JourneyCam
//
//  Created by 徐满心 on 2023/8/31.
//

import SwiftUI
import UnityFramework

class PracticeViewModel: NSObject, ObservableObject, NativeCallsProtocol {
    
    @Published private var practiceModel = PracticeModel();
    
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
}
