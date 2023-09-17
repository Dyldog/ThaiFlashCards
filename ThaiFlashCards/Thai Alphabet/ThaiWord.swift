//
//  ThaiWord.swift
//  ThaiFlashCards
//
//  Created by Dylan Elliott on 11/9/2023.
//

import Foundation

struct ThaiWord {
    let script: String
    let meaning: String
}

extension ThaiWord: CardDisplayable {
    var cardContent: CardContent { .init(front: .init(.largeText(script)), back: .init(.largeText(meaning))) }
}
