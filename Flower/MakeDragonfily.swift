//
//  MakeDragonfily.swift
//  Flower
//
//  Created by Chris Lee on 2023/12/12.
//

import Foundation
import UIKit

func makeDragonfily(showRandom: Bool) -> UIView {
    //蜻蜓
    let dragonflyView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height:100))

    //正圓形
    let circleView1 = UIView(frame: CGRect(x: dragonflyView.frame.width / 2, y:0, width: 20, height: 20))

    let circlePath1 = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 20, height: 20)) //眼睛
    circlePath1.append(UIBezierPath(ovalIn: CGRect(x: 32, y: 10, width: 20, height: 20)))//眼睛

    let circleLayer1 = CAShapeLayer()
    circleLayer1.path = circlePath1.cgPath
    circleLayer1.fillColor = UIColor.black.cgColor
    circleView1.layer.addSublayer(circleLayer1)

    let circleLayer2 = CAShapeLayer()//頭
    circleLayer2.path = UIBezierPath(ovalIn: CGRect(x: -10, y: 25, width: 50, height: 50)).cgPath
    circleLayer2.fillColor = UIColor(red: 239/255, green: 169/255, blue: 167/255, alpha: 1).cgColor
    circleView1.layer.addSublayer(circleLayer2)

    //身體
    let quadCurvePath1 = UIBezierPath()
    quadCurvePath1.move(to: CGPoint(x: 0, y: 80))

    quadCurvePath1.addQuadCurve(to: CGPoint(x:-25, y: 200), controlPoint: CGPoint(x:30, y: 120))
    quadCurvePath1.addQuadCurve(to: CGPoint(x:0, y: 80), controlPoint: CGPoint(x: -60, y: 170))

    quadCurvePath1.move(to: CGPoint(x:-30, y: 205))
    quadCurvePath1.addQuadCurve(to: CGPoint(x:-35, y: 290), controlPoint: CGPoint(x:-10, y: 270))
    quadCurvePath1.addQuadCurve(to: CGPoint(x:-55, y: 280), controlPoint: CGPoint(x: -50, y: 310))
    quadCurvePath1.addQuadCurve(to: CGPoint(x:-30, y: 205), controlPoint: CGPoint(x: -40, y: 220))

    let quadCurvePath2 = UIBezierPath(ovalIn: CGRect(x: -80, y: 305, width: 30, height: 80))
    quadCurvePath2.apply(CGAffineTransform.identity.rotated(by: .pi / 180 * 357))
    quadCurvePath1.append(quadCurvePath2)

    quadCurvePath1.move(to: CGPoint(x:-50, y: 395))
    quadCurvePath1.addQuadCurve(to: CGPoint(x:-45, y: 455), controlPoint: CGPoint(x: -30, y: 415))
    quadCurvePath1.addQuadCurve(to: CGPoint(x:-55, y: 455), controlPoint: CGPoint(x: -52, y: 470))
    quadCurvePath1.addQuadCurve(to: CGPoint(x:-50, y: 395), controlPoint: CGPoint(x: -65, y: 410))

    let quadCurveLayer1 = CAShapeLayer()
    quadCurveLayer1.path = quadCurvePath1.cgPath
    quadCurveLayer1.fillColor = UIColor(red: 239/255, green: 169/255, blue: 167/255, alpha: 1).cgColor

    quadCurveLayer1.lineCap = .round
    circleView1.layer.addSublayer(quadCurveLayer1)

    //左上翅膀
    let quadCurvePath3 = UIBezierPath()
    quadCurvePath3.move(to: CGPoint(x:-15, y: 95))
    quadCurvePath3.addQuadCurve(to: CGPoint(x:-170, y: 20), controlPoint: CGPoint(x:-90, y: -20))
    quadCurvePath3.addQuadCurve(to: CGPoint(x:-160, y: 50), controlPoint: CGPoint(x:-210, y: 40))
    quadCurvePath3.addQuadCurve(to: CGPoint(x:-25, y: 95), controlPoint: CGPoint(x:-60, y: 50))
    quadCurvePath3.addQuadCurve(to: CGPoint(x:-15, y: 95), controlPoint: CGPoint(x:-20, y: 99))

    //左下翅膀
    quadCurvePath3.move(to: CGPoint(x:-25, y: 115))
    quadCurvePath3.addQuadCurve(to: CGPoint(x:-220, y: 160), controlPoint: CGPoint(x:-200, y: 60))
    quadCurvePath3.addQuadCurve(to: CGPoint(x:-170, y: 160), controlPoint: CGPoint(x:-210, y: 180))
    quadCurvePath3.addQuadCurve(to: CGPoint(x:-25, y: 115), controlPoint: CGPoint(x:-90, y: 120))

    //右上翅膀
    quadCurvePath3.move(to: CGPoint(x:15, y: 110))
    quadCurvePath3.addQuadCurve(to: CGPoint(x:180, y: 120), controlPoint: CGPoint(x:135, y: 70))
    quadCurvePath3.addQuadCurve(to: CGPoint(x:175, y: 150), controlPoint: CGPoint(x:200, y: 145))
    quadCurvePath3.addQuadCurve(to: CGPoint(x:50, y: 120), controlPoint: CGPoint(x:100, y: 120))
    quadCurvePath3.addQuadCurve(to: CGPoint(x:15, y: 110), controlPoint: CGPoint(x:30, y: 120))

    //右下翅膀
    quadCurvePath3.move(to: CGPoint(x:20, y: 125))
    quadCurvePath3.addQuadCurve(to: CGPoint(x:180, y: 220), controlPoint: CGPoint(x:170, y: 150))
    quadCurvePath3.addQuadCurve(to: CGPoint(x:145, y: 240), controlPoint: CGPoint(x:175, y: 250))

    let quadCurveLayer3 = CAShapeLayer()
    quadCurveLayer3.path = quadCurvePath3.cgPath
    quadCurveLayer3.fillColor = UIColor(red: 242/255, green: 214/255, blue: 190/255, alpha: 1).cgColor
    circleView1.layer.addSublayer(quadCurveLayer3)

    dragonflyView.addSubview(circleView1)
    
    if showRandom {
        let scaleXY:CGFloat = CGFloat.random(in: 0.2...0.3)
        dragonflyView.transform = CGAffineTransform.identity.translatedBy(x: CGFloat(Int.random(in: 0...300)), y: CGFloat(Int.random(in: 110...750))).rotated(by: .pi / 180 * CGFloat(Int.random(in: 0...360))).scaledBy(x: scaleXY, y: scaleXY)
    }
    else {
        dragonflyView.transform = CGAffineTransform.identity.scaledBy(x: 0.3, y: 0.3)
    }
    return dragonflyView
}
