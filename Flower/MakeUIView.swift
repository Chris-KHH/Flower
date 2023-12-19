//
//  MakeUIView.swift
//  Flower
//
//  Created by Chris Lee on 2023/12/12.
//

import Foundation
import UIKit

func makeShapeLayerUIView(viewX: Int,viewY: Int,viewWidth: Int,viewHeight: Int, path: UIBezierPath, LayerInfo: LayerInfo) ->UIView{
    let view = UIView(frame: CGRect(x: viewX, y: viewY, width: viewWidth, height: viewHeight))
    
    let layer = CAShapeLayer()
    layer.path = path.cgPath
    layer.fillColor = LayerInfo.fillColor.cgColor
    
    layer.lineWidth = LayerInfo.lineWidth
    layer.strokeColor = LayerInfo.strokeColor.cgColor
    
    layer.shadowRadius = LayerInfo.shadowRadius
    layer.shadowColor = LayerInfo.shadowColor.cgColor
    layer.shadowOffset = LayerInfo.shadowOffset
    layer.shadowOpacity = LayerInfo.shadowOpacity
    
    view.layer.addSublayer(layer)
    view.transform = CGAffineTransform.identity.rotated(by: .pi / 180 * LayerInfo.rotated)
    return view
}

func makeGradientLayerUIView(viewX: Int,viewY: Int,viewWidth: Int,viewHeight: Int, path: UIBezierPath, LayerInfo: LayerInfo) ->UIView{
    let view = UIView(frame: CGRect(x: viewX, y: viewY, width: viewWidth, height: viewHeight))
    
    let layer = CAShapeLayer()
    layer.path = path.cgPath
    
    let gradientLayer = CAGradientLayer()
    gradientLayer.colors = LayerInfo.colors
    //gradientLayer.type = .conic
    gradientLayer.startPoint = LayerInfo.startPoint
    gradientLayer.endPoint = LayerInfo.endPoint
    gradientLayer.locations = LayerInfo.locations
    gradientLayer.frame = CGRect(x: 0, y: 0, width: viewWidth, height: viewHeight)
    gradientLayer.mask = layer
    
    view.layer.addSublayer(gradientLayer)
    view.transform = CGAffineTransform.identity.rotated(by: .pi / 180 * LayerInfo.rotated)
    return view
}
