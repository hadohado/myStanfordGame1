//
//  EMGameViewModel.swift
//  myStanfordGame1
//
//  Created by ha tuong do on 5/17/21.
//

import SwiftUI

class EMGameViewModel : ObservableObject {
    static let emojis: Array<String> = ["😋", "💛", "🍒", "☘️", "👩‍❤️‍👨", "🧲", "🈸", "🇺🇳","🦋" ]
    static let myImage = UIImage(named: "parrot")
    static let emojisImage: Array<UIImage> = [myImage!]
 
//    @Published private var model: MGameModel<String>
//        = MGameModel<String>( numberOfPairsOfCards: emojis.count) { pairIndex  in return emojis[pairIndex] }
    
    @Published private var model: MGameModel<String> = creaateEMGame()
    
    private static func creaateEMGame() -> MGameModel<String> {
        let emojis: Array<String> = ["😋", "💛", "🍒", "☘️"]
        // let emojis: Array<String> = ["😋", "💛", "🍒", "☘️", "👩‍❤️‍👨", "🧲", "🈸", "🇺🇳","🦋" ]
        return MGameModel<String>( numberOfPairsOfCards: emojis.count) { pairIndex  in
            return emojis[pairIndex] }
    }
    
    var cards: Array<MGameModel<String>.Card> {
        return model.cards
    }
    
    // I need this to make game choose !
    // MARK: - Intents
    
    func choose(card: MGameModel<String>.Card) {
        // objectWillChange.send() // re-active, dont need object..() since we have @Published above
        model.chooseCard(card: card)
    }
}
