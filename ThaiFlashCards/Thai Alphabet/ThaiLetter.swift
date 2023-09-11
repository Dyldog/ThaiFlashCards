//
//  ThaiAlphabet.swift
//  ThaiFlashCards
//
//  Created by Dylan Elliott on 26/8/2023.
//

import Foundation

enum ThaiLetter {
    case consonant(ThaiConsonant)
    case vowel(ThaiVowel)
    
    static var allCases: [ThaiLetter] = ThaiConsonant.allCases.map { .consonant($0) } + ThaiVowel.allCases.map {.vowel($0) }
}

extension ThaiLetter: CardDisplayable {
    var cardContent: CardContent {
        switch self {
        case let .consonant(letter): return letter.cardContent
        case let .vowel(letter): return letter.cardContent
        }
    }
}
