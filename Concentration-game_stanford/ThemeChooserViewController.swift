//
//  ThemeChooserViewController.swift
//  Concentration-game_stanford
//
//  Created by user166334 on 2/25/20.
//  Copyright © 2020 Олег Черных. All rights reserved.
//

import UIKit

class ThemeChooserViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        
        switch identifier {
            case "Choose Theme":
                guard
                    let themeName = (sender as? UIButton)?.currentTitle,
                    let gameVC = segue.destination as? GameViewController,
                    let themeIndex = ThemeProvider.themes.firstIndex(where: { $0.name == themeName })
                else { return }
                
                gameVC.gameTheme = ThemeProvider.themes[themeIndex]
                
                break
            default:
                break
        }
    }
}
