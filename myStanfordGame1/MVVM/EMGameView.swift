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
                CardView(card: card).onTapGesture {
                    withAnimation(.linear(duration: 0.75 )) { // was 1
                        viewModel.choose(card: card)
                    }
                }
                .padding(5)
            })
            .padding()
            .foregroundColor(Color.orange)
            
            HStack {
                Button(action: {
                    // body: ()  <--   () means function to be coded !  so need { ... }
                    // withAnimation(<#T##animation: Animation?##Animation?#>, <#T##body: () throws -> Result##() throws -> Result#>)
                    withAnimation(Animation.easeInOut)  { // was also (duration: 2)
                        self.viewModel.resetGame()
                    }
                }, label: {
                    Text("New Game")
                })
                
                Image("parrot").imageScale(.small)
            }
        }
    }
}


struct CardView: View {
    var card: MGameModel<String>.Card // public since we need to init
    
    var body: some View {
        GeometryReader { geometry  in
            self.body(for: geometry.size)
        }

    }
    @ViewBuilder
    private func body(for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatched {
            ZStack {
                Pie(startAngle: Angle.degrees(0.0 - 90), endAngle: Angle.degrees(110), clockwire: true)
                    .padding(5).opacity(0.4)
                Text(card.content).font(Font.system(size: fontSize(for: size)))
                    // add IMPLICIT animation: emoji flips 180 degree when there is matching
                    .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0)) // animate
                    .animation(card.isMatched ? Animation.linear(duration:  1)
                                .repeatForever(autoreverses: false) : .default)
                    // .animation(Animation.linear(duration:  1).repeatForever(autoreverses: false))
                    // .animation(Animation.linear(duration:  1).repeatForever())
                    //.animation(Animation.linear(duration: 1))
                    }
            .cardify(isFaceUp: card.isFaceUp)
            // .modifier ( Cardify(isFaceUp:  card.isFaceUp))
            .transition(AnyTransition.scale) // 2 card matched: matching cards shrink !
            // .rotation3DEffect( Angle.degrees(card.isFaceUp ? 0: 180), axis: (0,1,0) )
                                                          // (x: 0, y: 1, z: 0)            )
            // Circle()
        }
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
