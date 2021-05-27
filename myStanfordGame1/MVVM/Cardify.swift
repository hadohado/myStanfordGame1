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
            
            // now always have 4 items on card (no if ..)
            // this code with opacity fix the problem: now both card emoji will rotate if matched
            Group {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white).transition(.scale)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                content
            }
            .opacity(isFaceUp ? 1: 0) // if face-down -> fully transparent opacity = 0
            RoundedRectangle(cornerRadius: cornerRadius).fill()
            .opacity(isFaceUp ? 0 : 1)
            
                    
//            if isFaceUp {
//                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white).transition(.scale)
//                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
//                content
//            } else {
//                RoundedRectangle(cornerRadius: cornerRadius).fill()
//            }
            
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
 
