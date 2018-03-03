//
//  ViewController.swift
//  Apaya
//
//  Created by Zulwiyoza Putra on 03/03/18.
//  Copyright © 2018 Wiyoza. All rights reserved.
//

import UIKit

class ApayaViewController: UIViewController {

    @IBOutlet weak var flipCountLabel: UILabel!
    
    let emojis: [Int: String] = [1: "🍆", 2: "🍑", 3: "🍎", 4: "🍏", 5: "🍐", 6: "🍉"]
    
    lazy var game = Apaya(numberOfCards: (cardButtons.count + 1) / 2)
    
    var flipCount = 0
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
        if let index = cardButtons.index(of: sender) {
            flipCount += 1
            game.chooseCard(at: index)
            updateViewFromModel()
            flipCountLabel.text = "Flip Counts: \(flipCount)"
        } else {
            fatalError("This card is not included in cardButtons")
        }
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(getEmoji(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0.2562922537, green: 0.4709503055, blue: 0.9612054229, alpha: 1)
            }
        }
    }
    
    func getEmoji(for card: Card) -> String {
        
        guard let emoji = emojis[card.identifier] else {
            fatalError("The emoji available is fewer than cards")
        }
        
        return emoji
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

