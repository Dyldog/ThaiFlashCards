//
//  CardStack.swift
//  ThaiFlashCards
//
//  Created by Dylan Elliott on 18/9/2023.
//

import Foundation

class CardStack: ObservableObject {
    private var allCards: [CardContent]
    
    @Published private(set) var remainingCards: [CardContent]
    private var seenCards: [CardContent]
    
    var topCard: CardContent? { remainingCards.last }
    @Published var topIsFlipped: Bool = false
    
    let shuffled: Bool
    
    var isEmpty: Bool { allCards.isEmpty }
    
    init(cards: [CardContent], shuffled: Bool) {
        self.shuffled = shuffled
        self.allCards = cards
        self.remainingCards = []
        self.seenCards = []
        
        reset()
    }
    
    func setCards(_ cards: [CardContent]) {
        allCards = cards
        reset()
    }
    
    func cardIsFlipped(_ card: CardContent) -> Bool {
        if card == topCard {
            return topIsFlipped
        } else {
            return false
        }
    }
    func visibleFace(for card: CardContent) -> CardFaceModel {
        return cardIsFlipped(card) ? card.back : card.front
    }
    
    func flipTop() {
        topIsFlipped.toggle()
    }
    
    func removeTop() {
        guard let index = remainingCards.indices.last else { return }
        let topCard = remainingCards.remove(at: index)
        seenCards.append(topCard)
        topIsFlipped = false
    }
    
    func topTapped(onNewCard: ((CardContent) -> Void)? = nil) {
        switch topIsFlipped {
        case true:
            removeTop()
            if let topCard = topCard { onNewCard?(topCard) }
        case false:
            flipTop()
        }
    }
    
    func reset() {
        remainingCards = allCards
        topIsFlipped = false
        
        if shuffled {
            remainingCards.shuffle()
        }
        
        seenCards = []
    }
}
