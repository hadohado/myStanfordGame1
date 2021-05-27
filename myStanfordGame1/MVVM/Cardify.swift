//
//  Cardify.swift
//  myStanfordGame1
//
//  Created by ha tuong do on 5/25/21.
//

import SwiftUI

// 1st half of flip starting with card faced down: only show back of card (solid orange)
// 2nd half of flip: only show front of card = emoji

// must use AnimatableViewModifier, not Ani.. + ViewMod..
// AnimatableModifier = ViewModifier + Animatable
struct Cardify:  AnimatableModifier { // ViewModifier
    var rotation: Double // convert ViewModifier to be based on rotation
    
    init(isFaceUp: Bool) {
        rotation = isFaceUp ? 0 : 180
    }
    
    var isFaceUp: Bool {
            rotation < 90
    }
    
    // var animatableData: EmptyAnimatableData
    // we animate the rotation
    var animatableData: Double {
        get { return rotation  }
        set { rotation = newValue }
    }
    
    func body (content: Content) -> some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white).transition(.scale)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                
                Pie(startAngle: Angle.degrees(0.0 - 90), endAngle: Angle.degrees(110), clockwire: true)
                    .padding(5).opacity(0.4)
                
                content
                // .transition(AnyTransition.scale) // 5-26 was (.scale)
            } else {
                RoundedRectangle(cornerRadius: cornerRadius).fill()
                // .transition(AnyTransition.scale) // 5-26-2021
                // was (.identity)
            }
        }
        // .transition(AnyTransition.opacity)
        .rotation3DEffect( Angle.degrees(rotation), axis: (0,1,0) )
        
    }
    private let cornerRadius: CGFloat = 10.0
    private let edgeLineWidth: CGFloat = 3.0
    
}

extension View {
    func cardify (isFaceUp: Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}

// struct modifySomeView: ViewModifier {            <-- ViewModifier
//     var someVar: Bool
//     func body (content: Content) -> some View {  <-- body()
//         ZStack { ...
//              ...
//              content                             <-- content
//         }
//    }
// }
 
