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
    
    var gameTheme: Theme!
    private var cardEmojies = [Int:String]()
    @IBOutlet var cardRows: [UIStackView]!
    @IBOutlet var newGameButton: UIButton!
    @IBOutlet var themeNameLabel: UILabel!
    @IBOutlet var flipCountLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    
    @IBAction func onCardTouched(_ sender: UIButton) {
        guard let cardIndex = cards.firstIndex(of: sender) else { return }
        
        game.chooseCard(withIndex: cardIndex)
        updateViewWithModel()
    }
    
    @IBAction func onNewGameButtonTouched(_ sender: UIButton) {
        game.startNewGame()
        setupUI()
        updateViewWithModel()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        updateViewWithModel()
    }
    
    func updateViewWithModel() {
        flipCountLabel.text = "Flips: \(game.flipCount)"
        scoreLabel.text = "Score: \(game.score)"
        for i in cards.indices {
            if game.cards[i].isFaceUp {
                cards[i].setTitle(cardEmojies[game.cards[i].identifier], for: UIControl.State.normal)
                cards[i].backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                cards[i].setTitle("", for: UIControl.State.normal)
                cards[i].backgroundColor = game.cards[i].isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : gameTheme.cardColor
            }
        }
    }
    
    private func setupUI() {
        view.backgroundColor = gameTheme.backgroundColor
        newGameButton.backgroundColor = gameTheme.newGameButtonColor
        cards.forEach({ $0.backgroundColor = gameTheme.cardColor })
        themeNameLabel.text = gameTheme.name
        themeNameLabel.textColor = gameTheme.labelColor
        flipCountLabel.textColor = gameTheme.labelColor
        scoreLabel.textColor = gameTheme.labelColor
        bindCards(withEmojies: gameTheme.emojies)
    }
    
    func bindCards(withEmojies emojies: [String]) {
        let cardIdentifiers = Array(Set(game.cards.map({ $0.identifier })))
        for i in cardIdentifiers.indices {
            let cardIdentifier = cardIdentifiers[i]
            cardEmojies[cardIdentifier] = emojies[i]
        }
    }
}

