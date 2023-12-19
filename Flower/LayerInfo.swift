//
//  LayerInfo.swift
//  Flower
//
//  Created by Chris Lee on 2023/12/12.
//

import Foundation
import UIKit

class LayerInfo {
    var qty: Int
    var radius: Int
    var lineWidth: CGFloat = 0
    var shadowRadius: CGFloat = 0
    var shadowOffset:CGSize = CGSize(width: 0, height: 1)
    var shadowOpacity: Float = 1
    var rotated: CGFloat = 0
    var fillColor: UIColor = .white
    var strokeColor: UIColor = .white
    var shadowColor: UIColor = .white
    
    var colors: [CGColor] = [UIColor.red.cgColor,UIColor.white.cgColor]
    var startPoint: CGPoint = CGPoint(x: 0, y: 0)
    var endPoint: CGPoint = CGPoint(x: 1, y: 1)
    var locations: [NSNumber] = [0,0.5]
    
    init(qty: Int, radius: Int, lineWidth: CGFloat, shadowRadius: CGFloat, shadowOffset: CGSize, shadowOpacity: Float) {
        self.qty = qty
        self.radius = radius
        self.lineWidth = lineWidth
        self.shadowRadius = shadowRadius
        self.shadowOffset = shadowOffset
        self.shadowOpacity = shadowOpacity
    }
    
    init(qty: Int, radius: Int, lineWidth: CGFloat, shadowRadius: CGFloat) {
        self.qty = qty
        self.radius = radius
        self.lineWidth = lineWidth
        self.shadowRadius = shadowRadius
    }
    
    init(qty: Int, radius: Int, startPoint: CGPoint, endPoint: CGPoint) {
        self.qty = qty
        self.radius = radius
        self.startPoint = startPoint
        self.endPoint = endPoint
    }
    
}
