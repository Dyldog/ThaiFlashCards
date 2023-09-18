//
//  CardDisplayable.swift
//  ThaiFlashCards
//
//  Created by Dylan Elliott on 11/9/2023.
//

import Foundation

struct CardContent: Codable, Equatable, Identifiable {
    let front: CardFaceModel
    let back: CardFaceModel
    
    var id: String { front.spokenText + back.spokenText }
}

protocol CardDisplayable {
    var cardContent: CardContent { get }
}

extension Array where Element: CardDisplayable {
    var cardContent: [CardContent] { self.map { $0.cardContent } }
}
