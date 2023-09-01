//
//  ViewController.swift
//  JourneyCam
//
//  Created by 徐满心 on 2023/8/20.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc = UIHostingController(rootView: MainView())
        addChild(vc)
        vc.view.frame = self.view.frame
        view.addSubview(vc.view)
        vc.didMove(toParent: self)
    }
}
