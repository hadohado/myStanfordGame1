//
//  Model.swift
//  myStanfordGame1
//
//  Created by ha tuong do on 5/17/21.
//  Model for Memory Game

import Foundation

struct MGameModel<Content> where Content: Equatable {
  
    var cards: [Card] // line 12
    
    init(numPairsOfCards: Int, emojis: [String] ) {
        // self.cards = []
        self.cards = Array<Card>() // initialize cards on line 12 to empty Card array
        for idx in 0..<numPairsOfCards {
            let content = emojis[idx]
            cards.append(Card(id: idx * 2     , content: content))
            cards.append(Card(id: idx * 2 + 1 , content: content))
        }
        cards.shuffle()
    }
    
    // return card.id ?
    func chooseCard(card: Card) -> Int {
        return card.id
    }
    
    struct Card: Identifiable {
        var id: Int
        var isFaceUp: Bool = true // false
        var isMatched: Bool = false
        var content: String
        // var content: Content
    }
    
}


