//
//  Cardify.swift
//  myStanfordGame1
//
//  Created by ha tuong do on 5/25/21.
//

import SwiftUI

struct Cardify: ViewModifier {
    var isFaceUp: Bool
    func body (content: Content) -> some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                Pie(startAngle: Angle.degrees(0.0 - 90), endAngle: Angle.degrees(110), clockwire: true)
                    .padding(5).opacity(0.4)
                content
            } else {
                RoundedRectangle(cornerRadius: cornerRadius).fill()
            }
        }
    }
    private let cornerRadius: CGFloat = 10.0
    private let edgeLineWidth: CGFloat = 3.0
    
}

extension View {
    func cardify (isFaceUp: Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
