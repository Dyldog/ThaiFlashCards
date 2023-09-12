//
//  CardSet.swift
//  ThaiFlashCards
//
//  Created by Dylan Elliott on 12/9/2023.
//

import Foundation

struct CardSet {
    let title: String
    let cards: [CardContent]
    
    init(title: String, cards: [CardContent]) {
        self.title = title
        self.cards = cards
    }
    
    init(_ title: String, _ cards: [CardContent]) {
        self.init(title: title, cards: cards)
    }
}
