//
//  EMGameViewModel.swift
//  myStanfordGame1
//
//  Created by ha tuong do on 5/17/21.
//

import SwiftUI

class EMGameViewModel : ObservableObject {
    static let emojis: Array<String> = ["😋", "💛", "🍒", "☘️", "👩‍❤️‍👨", "🧲", "🈸", "🇺🇳","🦋" ]
    var model: MGameModel<String> = MGameModel(numPairsOfCards: emojis.count, emojis: emojis)
    
    var cards: Array<MGameModel<String>.Card> {
        return model.cards
    }
}
