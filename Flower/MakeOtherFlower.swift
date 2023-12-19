//
//  MakeOtherFlower.swift
//  Flower
//
//  Created by Chris Lee on 2023/12/15.
//

import Foundation
import UIKit

func makeOtherFlower(showRandom: Bool) ->UIView {
    let newLayerInfo: LayerInfo = LayerInfo.init(qty: 5, radius: 16, startPoint: CGPoint(x: 0.5, y: 0), endPoint: CGPoint(x: 0.5, y: 1))
    
    if Int.random(in: 0...1) == 0 {
        newLayerInfo.colors = [UIColor(red: 112/255, green: 59/255, blue: 147/255, alpha: 1).cgColor,UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1).cgColor,UIColor(red: 225/255, green: 201/255, blue: 14/255, alpha: 1).cgColor]
        newLayerInfo.locations = [0,0.3,0.5]
    }
    else {
        newLayerInfo.colors = [UIColor(red: 34/255, green: 23/255, blue: 143/255, alpha: 1).cgColor,UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1).cgColor]
        newLayerInfo.locations = [0,0.3]
    }
    
    let flowerView = UIView(frame: CGRect(x: 0, y: 0, width: newLayerInfo.radius * 5, height: newLayerInfo.radius * 5))

    let flowerPath = UIBezierPath()
    flowerPath.move(to: CGPoint(x: newLayerInfo.radius, y: 40))
    flowerPath.addQuadCurve(to: CGPoint(x: 12, y: 0), controlPoint: CGPoint(x: 0, y: 10))
    flowerPath.addQuadCurve(to: CGPoint(x: newLayerInfo.radius, y: 5), controlPoint: CGPoint(x: 18, y: 3))
    flowerPath.addQuadCurve(to: CGPoint(x: 20, y: 0), controlPoint: CGPoint(x: 18, y: 3))
    flowerPath.addQuadCurve(to: CGPoint(x: newLayerInfo.radius, y: 40), controlPoint: CGPoint(x: 35, y: 10))
    flowerPath.close()

    newLayerInfo.fillColor = .clear
    newLayerInfo.strokeColor = UIColor(red: 133/255, green: 137/255, blue: 137/255, alpha: 1)
    newLayerInfo.lineWidth = 1
    
    for i in 1...newLayerInfo.qty {
            newLayerInfo.rotated = CGFloat(360 / newLayerInfo.qty * i)
            flowerView.addSubview(makeShapeLayerUIView(viewX: 26, viewY: 5, viewWidth: newLayerInfo.radius * 2, viewHeight: newLayerInfo.radius * 5, path: flowerPath, LayerInfo: newLayerInfo))
        
        flowerView.addSubview(makeGradientLayerUIView(viewX: 26, viewY: 5, viewWidth: newLayerInfo.radius * 2, viewHeight: newLayerInfo.radius * 5, path: flowerPath, LayerInfo: newLayerInfo))
    }
    
    if showRandom {
        let scaleXY:CGFloat = CGFloat.random(in: 0.5...0.7)
        flowerView.transform = CGAffineTransform.identity.translatedBy(x: CGFloat(Int.random(in: 0...300)), y: CGFloat(Int.random(in: 110...750))).rotated(by: .pi / 180 * CGFloat(Int.random(in: 0...360))).scaledBy(x: scaleXY, y: scaleXY)
    }
    else {
        flowerView.transform = CGAffineTransform.identity.scaledBy(x: 1.1, y: 1.1)
    }
    return flowerView

}
