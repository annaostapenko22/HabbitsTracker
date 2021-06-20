//
//  CustomTabBar.swift
//  TravelApp
//
//  Created by Владимир Рубис on 20.06.2021.
//

import UIKit

class CustomTabBar: UITabBar {

    private var tabBarWidth: CGFloat { self.bounds.width }
    private var tabBarHeight: CGFloat { self.bounds.height }
    private var centerWidth: CGFloat { self.bounds.width / 2 }
    private let circleRadius: CGFloat = 27
    
    private var shapeLayer: CALayer?
    private var circleLayer: CALayer?

    private func shapePath() -> CGPath {
        let path = UIBezierPath() // 1
        path.move(to: CGPoint(x: 0, y: 0)) // 2
        path.addLine(to: CGPoint(x: tabBarWidth, y: 0)) // 3
        path.addLine(to: CGPoint(x: tabBarWidth, y: tabBarHeight)) // 4
        path.addLine(to: CGPoint(x: 0, y: tabBarHeight)) // 5
        path.close() // 6
        return path.cgPath // 7
    }
    
    private func circlePath() -> CGPath {
        let path = UIBezierPath() // 1
        path.addArc(withCenter: CGPoint(x: centerWidth, y: 12), // 2
                    radius: circleRadius, // 3
                    startAngle: 180 * .pi / 180, // 4
                    endAngle: 0 * 180 / .pi, // 5
                    clockwise: true) // 6
        return path.cgPath // 7
    }
    
    private func drawTabBar() {
        // 1
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = shapePath()
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor(red: 155/255, green: 160/255, blue: 163/255, alpha: 1).cgColor
        // 2
        let circleLayer = CAShapeLayer()
        circleLayer.path = circlePath()
        circleLayer.strokeColor = UIColor.lightGray.cgColor
        circleLayer.fillColor = UIColor(red: 155/255, green: 160/255, blue: 163/255, alpha: 1).cgColor
        circleLayer.lineWidth = 1.0

        // 3
        if let oldShapeLayer = self.shapeLayer {
            self.layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
        } else {
            self.layer.insertSublayer(shapeLayer, at: 0)
        }

        if let oldCircleLayer = self.circleLayer {
            self.layer.replaceSublayer(oldCircleLayer, with: circleLayer)
        } else {
            self.layer.insertSublayer(circleLayer, at: 1)
        }

        // 4
        self.shapeLayer = shapeLayer
        self.circleLayer = circleLayer
    }
    
    override func draw(_ rect: CGRect) {
        drawTabBar()
    }
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let pointIsInside = super.point(inside: point, with: event) // 1
        if pointIsInside == false { // 2
            for subview in subviews { // 2.1
                let pointInSubview = subview.convert(point, from: self) // 2.2
                if subview.point(inside: pointInSubview, with: event) { // 2.3
                    return true // 2.3.1
                }
            }
        }
        return pointIsInside // 3
    }
}

