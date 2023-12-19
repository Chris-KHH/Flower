//
//  FlowerPart.swift
//  Flower
//
//  Created by Chris Lee on 2023/12/12.
//

import Foundation

enum PrunusmumePart {
    case outside
    case color
    case inside
    
    func setLayerInfo() ->LayerInfo {
        switch self {
        case .outside:
            return LayerInfo(qty: 5, radius: 25, lineWidth: 3, shadowRadius: 0)
        case .color:
            return LayerInfo(qty: 25, radius: 0, lineWidth: 0, shadowRadius: CGFloat(Int.random(in: 12...15)), shadowOffset:  CGSize(width: 0, height: 1), shadowOpacity: 0.9)
        case .inside:
            return LayerInfo(qty: 12, radius: 3, lineWidth: 3, shadowRadius: 0)
        }
    }
}
