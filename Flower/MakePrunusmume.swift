//
//  MakePrunusmume.swift
//  Flower
//
//  Created by Chris Lee on 2023/12/12.
//

import Foundation
import UIKit

func makePrunusmume(showRandom: Bool) ->UIView {
    //花邊
    var newFlowerPart = PrunusmumePart.outside
    var newLayerInfo = newFlowerPart.setLayerInfo()
    newLayerInfo.fillColor = .white
    newLayerInfo.strokeColor = UIColor(red: 133/255, green: 137/255, blue: 137/255, alpha: 1)
    
    let flowerView = UIView(frame: CGRect(x: 0, y: 0, width: newLayerInfo.radius * 6, height: newLayerInfo.radius * 6))
    
    let flowerPath = UIBezierPath()
    flowerPath.move(to: CGPoint(x: newLayerInfo.radius, y: 0))
    flowerPath.addArc(withCenter: CGPoint(x: newLayerInfo.radius,y: newLayerInfo.radius * 2 + 15 ), radius: CGFloat(newLayerInfo.radius), startAngle: .pi / 180 * 290 , endAngle: .pi / 180 * 250 , clockwise: true)
    flowerPath.addLine(to: CGPoint(x: newLayerInfo.radius - (newLayerInfo.radius / 2)  , y: 0))
    flowerPath.close()
    
    for i in 1...newLayerInfo.qty {
        newLayerInfo.rotated = CGFloat(360 / newLayerInfo.qty * i)
        flowerView.addSubview(makeShapeLayerUIView(viewX: Int(flowerView.frame.width)  / 2 - newLayerInfo.radius, viewY: Int(flowerView.frame.height) / 2 - newLayerInfo.radius, viewWidth: newLayerInfo.radius * 2, viewHeight: newLayerInfo.radius * 2, path: flowerPath, LayerInfo: newLayerInfo))
    }
    
    let flowerColors = [
        PrimaryColor(r: 255, g: 192, b: 203, a:1),
        PrimaryColor(r: 238, g: 130, b: 238, a:1),
        PrimaryColor(r: 255, g: 174, b: 201, a:1),
        PrimaryColor(r: 200, g: 191, b: 231, a:1),
        PrimaryColor(r: 90, g: 231, b: 222, a:1),
        PrimaryColor(r: 149, g: 167, b: 217, a:1),
        PrimaryColor(r: 157, g: 230, b: 249, a:1)
    ]
    
    let colorIndex = Int.random(in: 0...flowerColors.count-1)
    //花色
    newFlowerPart = PrunusmumePart.color
    newLayerInfo = newFlowerPart.setLayerInfo()
    
    //搭陰影做漸層效果
    for i in 1...newLayerInfo.qty {
        flowerPath.removeAllPoints()
        newLayerInfo.radius = 40 - i
        
        newLayerInfo.fillColor = UIColor(red: CGFloat(flowerColors[colorIndex].r - (i * 5)) / 255, green: CGFloat(flowerColors[colorIndex].g - (i * 5)) / 255, blue: CGFloat(flowerColors[colorIndex].b - (i * 5)) / 255, alpha: CGFloat(flowerColors[colorIndex].a))
        
        newLayerInfo.strokeColor = newLayerInfo.fillColor
        newLayerInfo.shadowColor = newLayerInfo.fillColor
        
        flowerPath.addArc(withCenter: flowerView.center, radius: CGFloat(newLayerInfo.radius), startAngle: 0, endAngle: .pi / 180 * 360, clockwise: true)
        
        flowerView.addSubview(makeShapeLayerUIView(viewX: 0, viewY: 0, viewWidth: Int(flowerView.frame.width), viewHeight: Int(flowerView.frame.height), path: flowerPath, LayerInfo: newLayerInfo))
    }
    
    //花蕊
    newFlowerPart = PrunusmumePart.inside
    newLayerInfo = newFlowerPart.setLayerInfo()
    newLayerInfo.fillColor = .white
    newLayerInfo.strokeColor = UIColor(red: 243 / 255, green: 220 / 255, blue: 140 / 255, alpha: CGFloat.random(in: 0.2...0.6))
    
    flowerPath.removeAllPoints()
    flowerPath.move(to: CGPoint(x: newLayerInfo.radius * 4 / 3 , y: 0))
    flowerPath.addArc(withCenter: CGPoint(x: newLayerInfo.radius,y: newLayerInfo.radius * 9 ), radius: CGFloat(newLayerInfo.radius), startAngle: .pi / 180 * 290 , endAngle: .pi / 180 * 250 , clockwise: true)
    flowerPath.addLine(to: CGPoint(x: newLayerInfo.radius - (newLayerInfo.radius / 2)  , y: 0))
    flowerPath.close()
    
    for i in 1...newLayerInfo.qty {
        newLayerInfo.rotated = CGFloat(360 / newLayerInfo.qty * i)
        flowerView.addSubview(makeShapeLayerUIView(viewX: Int(flowerView.frame.width)  / 2 - newLayerInfo.radius, viewY: Int(flowerView.frame.height) / 2 - newLayerInfo.radius, viewWidth: newLayerInfo.radius * 2, viewHeight: newLayerInfo.radius * 2, path: flowerPath, LayerInfo: newLayerInfo))
    }
  
    if showRandom {
        let scaleXY:CGFloat = CGFloat.random(in: 0.7...1)
        flowerView.transform = CGAffineTransform.identity.translatedBy(x: CGFloat(Int.random(in: 0...300)), y: CGFloat(Int.random(in: 110...750))).rotated(by: .pi / 180 * CGFloat(Int.random(in: 0...360))).scaledBy(x: scaleXY, y: scaleXY)
    }
    else {
        flowerView.transform = CGAffineTransform.identity.translatedBy(x: -30, y: 0).rotated(by: .pi / 180 * 180).scaledBy(x: 0.8, y: 0.8)
    }
    
    return flowerView
}
