//
//  ContentView.swift
//  myStanfordGame1
//
//  Created by ha tuong do on 5/17/21.
//

import SwiftUI

struct EMGameView: View {
    @ObservedObject var viewModel: EMGameViewModel
    
//    var body: some View {
//        ForEach(0..<4) {_ in
//            GeometryReader { geometry  in
//                ZStack {
//                    RoundedRectangle(cornerRadius: 10 ).fill(Color.white)
//                    RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
//                    Text("💋")
//                }
//                .padding()
//                .font(Font.system(size: min(geometry.size.width, geometry.size.height) * fontScaleFactor ))
//            }
//        }
//    }
    var body: some View {
        
        // Grid take a func { card in ... } that return
        //      a view & location of view to draw within the Grid
        Grid(viewModel.cards, viewForItem: { card  in
            CardView(card: card)
                .onTapGesture {
                    viewModel.choose(card: card)
                }
            .padding(5)
        })
        .padding()
        .foregroundColor(Color.orange)
    }
    
    let cornerRadius: CGFloat = 10.0
    let edgeLineWidth: CGFloat = 3.0
    let fontScaleFactor: CGFloat = 0.75
    
}



struct CardView: View {
    var card: MGameModel<String>.Card
    
    var body: some View {
    
        GeometryReader { geometry  in
            ZStack {
                if card.isFaceUp {
                    RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                    RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                    Text(card.content)
                    //Text(card.content).padding().font(Font.largeTitle)
                } else {
                    if !card.isMatched { // if cards already matched, dont show on screen anymore
                        RoundedRectangle(cornerRadius: cornerRadius).fill()
                    }
                }
            } // Z
            .font(Font.system(size: min(geometry.size.width, geometry.size.height) * fontScaleFactor ))
            // .font(Font.largeTitle)
        } // Geo
    }
    
    // MARK: - Drawing constants
    //         control panel
    let cornerRadius: CGFloat = 10.0
    let edgeLineWidth: CGFloat = 3.0
    let fontScaleFactor: CGFloat = 0.75
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        // MARK: - my new code 5-24-2021
        EMGameView(viewModel: EMGameViewModel() )
    }
}
