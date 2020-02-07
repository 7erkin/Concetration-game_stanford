//
//  ViewController.swift
//  Concentration-game_stanford
//
//  Created by Олег Черных on 08/02/2020.
//  Copyright © 2020 Олег Черных. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    private lazy var game: Game = {
        let cardsCount = self.cardRows.reduce(0, { $0 + $1.subviews.count })
        return Game(numberOfPairs: cardsCount / 2)
    }()
    
    private lazy var cards: [UIButton] = {
        return cardRows.reduce([UIView](), { $0 + $1.subviews }).map({ $0 as! UIButton })
    }()
    
    private var emoji = ["🐶", "🐷", "🐸", "🦋", "🐙", "🐠", "🐼", "🐅"]
    
    @IBOutlet var cardRows: [UIStackView]!
    
    @IBAction func onCardTouched(_ sender: UIButton) {
        guard let cardIndex = cards.firstIndex(of: sender) else { return }
        
        game.chooseCard(withIndex: cardIndex)
        updateViewWithModel()
    }
    
    @IBAction func onNewGameButtonTouched(_ sender: UIButton) {
        game.startNewGame()
        updateViewWithModel()
    }
    
    func updateViewWithModel() {
        for i in cards.indices {
            if game.cards[i].isMatched {
                cards[i].setTitle("", for: UIControl.State.normal)
                cards[i].backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
                continue
            }
            
            if game.cards[i].isFaceUp {
                cards[i].setTitle(emoji[i / 2], for: UIControl.State.normal)
                cards[i].backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                continue
            }
            
            cards[i].setTitle("", for: UIControl.State.normal)
            cards[i].backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        }
    }
}

