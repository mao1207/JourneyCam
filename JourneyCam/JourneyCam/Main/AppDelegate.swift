//
//  AppDelegate.swift
//  JourneyCam
//
//  Created by 徐满心 on 2023/8/20.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        Unity.shared.setHostMainWindow(window)
        
        return true
    }
}
