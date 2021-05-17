//
//  ContentView.swift
//  myStanfordGame1
//
//  Created by ha tuong do on 5/17/21.
//

import SwiftUI

struct MGameView: View {
    
    var body: some View {
        ForEach(0..<3) {_ in
            GeometryReader { geometry  in
                ZStack {
                    RoundedRectangle(cornerRadius: 10 ).fill(Color.white)
                    RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                    Text("💋")
                }
                .padding()
                .font(Font.system(size: min(geometry.size.width, geometry.size.height) * fontScaleFactor ))
                
            }
            
        }
        
        //        Text("Hi, world!")
        
    }
    
    let cornerRadius: CGFloat = 10.0
    let edgeLineWidth: CGFloat = 3.0
    let fontScaleFactor: CGFloat = 0.75
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MGameView()
    }
}
