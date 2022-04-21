//
//  VAActivityIndicatorSupport.swift
//  VALoader
//
//  Created by Senthilkumar Kuppuraj on 11/04/22.
//

import UIKit

extension CAPropertyAnimation {
    enum Key: String {
        var path: String {
            return rawValue
        }

        case strokeStart = "strokeStart"
        case strokeEnd = "strokeEnd"
        case strokeColor = "strokeColor"
        case rotationZ = "transform.rotation.z"
        case scale = "transform.scale"
    }

    convenience init(key: Key) {
        self.init(keyPath: key.path)
    }
}

extension CGRect {
    var center: CGPoint {
        return CGPoint(x: midX, y: midY)
    }
}

extension CGSize {
    var min: CGFloat {
        return CGFloat.minimum(width, height)
    }
}

extension UIBezierPath {
    convenience init(center: CGPoint, radius: CGFloat) {
        self.init(arcCenter: center, radius: radius, startAngle: 0, endAngle: CGFloat(.pi * 2.0), clockwise: true)
    }
}
