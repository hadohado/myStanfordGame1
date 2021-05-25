//
//  ContentView.swift
//  myStanfordGame1
//
//  Created by ha tuong do on 5/17/21.
//

import SwiftUI

struct EMGameView: View {
    @ObservedObject var viewModel: EMGameViewModel // public for scene delegate to access
    
    var body: some View {
        VStack {
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
            // Text("hi there")
            Image("parrot").imageScale(.small)
            
        }
            
    }
    
//    let cornerRadius: CGFloat = 10.0
//    let edgeLineWidth: CGFloat = 3.0
//    let fontScaleFactor: CGFloat = 0.75
    
}



struct CardView: View {
    var card: MGameModel<String>.Card // public since we need to init
    
    var body: some View {
        GeometryReader { geometry  in
            self.body(for: geometry.size)
        }

    }
    
    private func body(for size: CGSize) -> some View {
            ZStack {
                if card.isFaceUp {
                    RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                    RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                    Text(card.content)
                } else {
                    if !card.isMatched {
                        RoundedRectangle(cornerRadius: cornerRadius).fill()
                    }
                }
            } // Z
            .font(Font.system(size: fontSize(for: size)))
            // .font(Font.system(size: min(geometry.size.width, geometry.size.height) * fontScaleFactor ))
            // .font(Font.largeTitle)
    }
    
    // MARK: - Drawing constants
    //         control panel
    private let cornerRadius: CGFloat = 10.0
    private let edgeLineWidth: CGFloat = 3.0
    private let fontScaleFactor: CGFloat = 0.75
    private func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.75 
    }
    
}




//struct CardView: View {
//    var card: MGameModel<String>.Card
//
//    var body: some View { // body needs be public since system will call it
//
//        GeometryReader { geometry  in
//            ZStack {
//                if card.isFaceUp {
//                    RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
//                    RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
//                    Text(card.content)
//                    //Text(card.content).padding().font(Font.largeTitle)
//                } else {
//                    if !card.isMatched { // if cards already matched, dont show on screen anymore
//                        RoundedRectangle(cornerRadius: cornerRadius).fill()
//                    }
//                }
//            } // Z
//            .font(Font.system(size: min(geometry.size.width, geometry.size.height) * fontScaleFactor ))
//            // .font(Font.largeTitle)
//        } // Geo
//    }
//
//    // MARK: - Drawing constants
//    //         control panel
//    private let cornerRadius: CGFloat = 10.0
//    private let edgeLineWidth: CGFloat = 3.0
//    private let fontScaleFactor: CGFloat = 0.75
//
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        // MARK: - my new code 5-24-2021
        EMGameView(viewModel: EMGameViewModel() )
    }
}
