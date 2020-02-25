//
//  ThemeProvider.swift
//  Concentration-game_stanford
//
//  Created by Олег Черных on 08/02/2020.
//  Copyright © 2020 Олег Черных. All rights reserved.
//

import Foundation
import UIKit

struct Theme {
    var name: String
    var emojies: [String]
    var backgroundColor: UIColor
    var cardColor: UIColor
    var newGameButtonColor: UIColor
    var labelColor: UIColor
}

struct ThemeProvider {
    static var themes: [Theme] = [
        Theme(
            name: "Animals",
            emojies: ["🐶", "🐷", "🐸", "🦋", "🐙", "🐠", "🐼", "🐅"],
            backgroundColor: #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1),
            cardColor: #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1),
            newGameButtonColor: #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1),
            labelColor: #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        ),
        Theme(
            name: "Balls",
            emojies: ["🏀", "⚾️", "🥎", "🏉", "⚽️", "🎾", "🎱", "🏈"],
            backgroundColor: #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1),
            cardColor: #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1),
            newGameButtonColor: #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1),
            labelColor: #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)
        ),
        Theme(
            name: "Faces",
            emojies: ["😃", "🧐", "😎", "🤩", "🤪", "🥰", "🥳", "😍"],
            backgroundColor: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1),
            cardColor: #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1),
            newGameButtonColor: #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1),
            labelColor: #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)
        )
    ]
    
    static func getRandomTheme() -> Theme {
        let themeIndex = Int.random(in: 0..<themes.count)
        return themes[themeIndex]
    }
}
