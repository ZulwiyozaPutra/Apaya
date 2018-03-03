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
    var currentFaceUpCardIndex: Int?
    
    init(numberOfCards: Int) {
        for _ in 0..<numberOfCards {
            let card = Card()
            cards += [card, card]
        }
        // TODO: shuffle the cards
    }
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            // Ini kalau kasus yang dipilih belum pernah matched then ... execute this:
            
            
            if let matchedIndex = currentFaceUpCardIndex, matchedIndex != index {
                // Action for second card trial
                
                // This block only executed when currentFaceCard is not nil
                if cards[matchedIndex].identifier == cards[index].identifier {
                    cards[matchedIndex].isMatched = true
                    cards[index].isMatched = true
                }
                
                // Action if only the first trial
                cards[index].isFaceUp = true
                currentFaceUpCardIndex = nil
                
            } else {
                // Action for third card trial
                for flippedDownIndex in cards.indices {
                    cards[flippedDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                currentFaceUpCardIndex = index
            }
        }
    }
}
