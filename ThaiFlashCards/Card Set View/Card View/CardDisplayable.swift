//
//  CardDisplayable.swift
//  ThaiFlashCards
//
//  Created by Dylan Elliott on 11/9/2023.
//

import Foundation

typealias CardContent = (front: CardFaceModel, back: CardFaceModel)

protocol CardDisplayable {
    var cardContent: CardContent { get }
}

extension Array where Element: CardDisplayable {
    var cardContent: [CardContent] { self.map { $0.cardContent } }
}
