//
//  Trapezoid.swift
//  JourneyCam
//
//  Created by 徐满心 on 2023/8/31.
//

import SwiftUI

struct Trapezoid: Shape {
  @State var edge: CGFloat = 10
  func path(in rect: CGRect) -> Path {
    var path = Path()
    path.move(to: CGPoint(x: rect.minX + edge, y: rect.minY))
    path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY ))
    path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY ))
    path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
    path.closeSubpath()
    return path
  }
}


