//
//  Game.swift
//  Concentration-game_stanford
//
//  Created by Олег Черных on 08/02/2020.
//  Copyright © 2020 Олег Черных. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifier = 0
    static func getIdentifier() -> Int {
        let returnedIdentifier = identifier
        identifier += 1
        return returnedIdentifier
    }
    
    init() {
        identifier = Card.getIdentifier()
    }
}

struct Game {
    var cards = [Card]()
    private var pairOfChoosenCard: (firstCardIndex: Int?, secondCardIndex: Int?)
    
    init(numberOfPairs: Int) {
        for _ in 0..<numberOfPairs {
            let card = Card()
            cards += [card, card]
        }
    }
    
    mutating func chooseCard(withIndex index: Int) {
        if cards[index].isFaceUp || cards[index].isMatched { return }

        cards[index].isFaceUp = true
        
        if pairOfChoosenCard.firstCardIndex == nil {
            pairOfChoosenCard.firstCardIndex = index
            return
        }
        
        if pairOfChoosenCard.secondCardIndex == nil {
            pairOfChoosenCard.secondCardIndex = index
            return
        }
        
        if cards[pairOfChoosenCard.firstCardIndex!].identifier == cards[pairOfChoosenCard.secondCardIndex!].identifier {
            cards[pairOfChoosenCard.firstCardIndex!].isMatched = true
            cards[pairOfChoosenCard.secondCardIndex!].isMatched = true
        }
        cards[pairOfChoosenCard.firstCardIndex!].isFaceUp = false
        cards[pairOfChoosenCard.secondCardIndex!].isFaceUp = false
        
        pairOfChoosenCard = (index, nil)
    }
    
    mutating func startNewGame() {
        pairOfChoosenCard = (nil, nil)
        
        for i in cards.indices {
            cards[i].isFaceUp = false
            cards[i].isMatched = false
        }
    }
}
