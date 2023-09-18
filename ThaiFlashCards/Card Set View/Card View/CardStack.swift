//
//  CardStack.swift
//  ThaiFlashCards
//
//  Created by Dylan Elliott on 18/9/2023.
//

import Foundation

class CardStack: ObservableObject {
    @Published private var allCards: [CardContent]
    
    @Published private(set) var remainingCards: [CardContent]
    private var seenCards: [CardContent]
    
    var topCard: CardContent? { remainingCards.last }
    @Published var topIsFlipped: Bool = false
        
    var isEmpty: Bool { allCards.isEmpty }
    var hasSeenCards: Bool { !seenCards.isEmpty }
    
    init(cards: [CardContent]) {
        self.allCards = cards
        self.remainingCards = []
        self.seenCards = []
        
        reset()
    }
    
    func setCards(_ cards: [CardContent], reset: Bool = true) {
        allCards = cards
        if reset { self.reset() }
    }
    
    func addCardToTop(_ card: CardContent) {
        allCards.append(card)
        remainingCards.append(card)
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
    
    func readdLastSeen() {
        guard let index = seenCards.indices.last else { return }
        let last = seenCards.remove(at: index)
        remainingCards.append(last)
        topIsFlipped = false
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
        
        seenCards = []
    }
}
