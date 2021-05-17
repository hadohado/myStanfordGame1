//
//  Model.swift
//  myStanfordGame1
//
//  Created by ha tuong do on 5/17/21.
//  Model for Memory Game

import Foundation

struct MGameModel<Content> where Content: Equatable {
  
    var cards: [Card]
    
    init(cards: [Card]) {
        self.cards = []
    }
    
    // return card.id ?
    func chooseCard(card: Card) -> Int {
        return card.id
    }
    
    struct Card: Identifiable {
        var id: Int
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: Content
    }
    
}


