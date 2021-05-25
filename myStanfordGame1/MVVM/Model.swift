//
//  Model.swift
//  myStanfordGame1
//
//  Created by ha tuong do on 5/17/21.
//  Model for Memory Game

//  lecture 5: Access control: private or private(set)
//  choose()should be public because user choose card to play game
//  init() should be public

import Foundation

struct MGameModel<Content> where Content: Equatable {
    // when people get these cards, they only get a copy of it
    private(set) var cards: [Card] // dont use private since ViewModel can't no longer access model.cards
    // var cards: [Card] // line 12
    // private(set) means setting the cards is private but reading by ViewModel is ok
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> Content ) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            // this model doesn't know what the CardContent is, let emojimemorygame viewmodel does it
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id: pairIndex * 2    ,  content: content) )
            cards.append(Card(id: pairIndex * 2 + 1,  content: content) )
        }
        cards.shuffle()
    }
    
    struct Card: Identifiable {
        var id: Int
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        // var content: String
        var content: Content
    }
    
    // change to private 5-24-2021
    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter { cards[$0].isFaceUp }.only }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }

    //------------------------------------------------------------------
    // play game by choosing card to turn 1 or 2 cards up to match cards
    //------------------------------------------------------------------
    mutating func chooseCard(card: Card) {  //    🧲
        
        if  let chosenIndex: Int = cards.firstIndex(matching: card),
            !cards[chosenIndex].isFaceUp,
            !cards[chosenIndex].isMatched {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content { // matched !
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                cards[chosenIndex].isFaceUp = true
                
            } else { indexOfTheOneAndOnlyFaceUpCard  = chosenIndex }
        }
    }
    
    // my initial code
    //    func chooseCard(card: Card) -> Int {
    //        return card.id
    //    }
    
//    func index(of card: Card) -> Int {
//
//        for idx in 0..<cards.count {
//            if cards[idx].id == card.id { return idx }
//        }
//        return 0 // TODO: bogus! need to fix this code
//    }
}


