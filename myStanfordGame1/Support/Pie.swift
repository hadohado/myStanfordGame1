//
//  Pie.swift
//  myStanfordGame1
//
//  Created by ha tuong do on 5/25/21.
//

import SwiftUI

// this Shape will be re-drawn over and over during animation with
// these 2 things startAngle & endAngle being animated
// things are being sliced up into little pieces by the animation system

struct Pie: Shape { // all Shape already conforms to Animatable
    var startAngle: Angle
    var endAngle: Angle
    var clockwire: Bool = false
    
    // must add this var to get animation for this Shape
    // we want to animate this Pie (represented by timer) (change the angle)
    // we connect up 2 var startAngle, endAngle to our animation
    var animatableData: AnimatablePair<Double, Double> { // EmptyAnimatableData
        get {
            AnimatablePair(startAngle.radians, endAngle.radians)
        }
        set {
            startAngle = Angle.radians(newValue.first)
            endAngle = Angle.radians(newValue.second)
        }
    }
    
    
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        let start = CGPoint (
            x: center.x + radius * cos(CGFloat(startAngle.radians)),
            y: center.y + radius * sin(CGFloat(startAngle.radians)) // cos() does weird thing
        )
        
        var p = Path()
        p.move(to: center)
        p.addLine(to: start)
        p.addArc(
            center: center,
            radius: radius,
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: clockwire
        )
        p.addLine(to: center)
        return p
    }
    
}

