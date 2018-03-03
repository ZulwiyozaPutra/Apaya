//
//  Apaya.swift
//  Apaya
//
//  Created by Zulwiyoza Putra on 03/03/18.
//  Copyright © 2018 Wiyoza. All rights reserved.
//

import Foundation

class Apaya {
    var cards = [Card]()
    
    init(numberOfCards: Int) {
        for _ in 0..<numberOfCards {
            let card = Card()
            cards += [card, card]
        }
        // TODO: shuffle the cards
    }
}
