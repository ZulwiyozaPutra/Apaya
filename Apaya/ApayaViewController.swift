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
    
    let emojis: [String] = ["🍆", "🍑", "🍎", "🍏"]
    
    lazy var game = Apaya(numberOfCards: (cardButtons.count + 1) / 2)
    
    var flipCount = 0
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
        if let index = cardButtons.index(of: sender) {
            let emoji = getEmoji(fromIndex: index)
            let card = cardButtons[index]
            card.setTitle(emoji, for: .normal)
            card.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
            flipCount += 1
            flipCountLabel.text = "Flip Count: \(flipCount)"
        } else {
            fatalError("This card is not included in cardButtons")
        }
    }
    
    func getEmoji(fromIndex index: Int) -> String {
        if index % 2 == 0 {
            return emojis[0]
        } else {
            return emojis[1]
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

