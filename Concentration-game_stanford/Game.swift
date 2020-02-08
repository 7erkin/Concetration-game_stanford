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
    var hasAlreadyFacedUp = false
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
    private(set) var flipCount = 0
    private(set) var score = 0
    
    init(numberOfPairs: Int) {
        for _ in 0..<numberOfPairs {
            let card = Card()
            cards += [card, card]
        }
        
        cards.shuffle()
    }
    
    mutating func chooseCard(withIndex index: Int) {
        if cards[index].isFaceUp || cards[index].isMatched { return }

        flipCount += 1
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
            score += 2
        } else {
            if cards[pairOfChoosenCard.firstCardIndex!].hasAlreadyFacedUp {
                score -= 1
            } else {
                cards[pairOfChoosenCard.firstCardIndex!].hasAlreadyFacedUp = true
            }
            if cards[pairOfChoosenCard.secondCardIndex!].hasAlreadyFacedUp {
                score -= 1
            } else {
                cards[pairOfChoosenCard.secondCardIndex!].hasAlreadyFacedUp = true
            }
        }
        
        cards[pairOfChoosenCard.firstCardIndex!].isFaceUp = false
        cards[pairOfChoosenCard.secondCardIndex!].isFaceUp = false
        
        pairOfChoosenCard = (index, nil)
    }
    
    mutating func startNewGame() {
        flipCount = 0
        score = 0
        pairOfChoosenCard = (nil, nil)
        
        for i in cards.indices {
            cards[i].isFaceUp = false
            cards[i].isMatched = false
            cards[i].hasAlreadyFacedUp = false
        }
    }
}
