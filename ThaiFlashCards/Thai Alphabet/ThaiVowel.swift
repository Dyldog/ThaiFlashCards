//
//  ThaiVowel.swift
//  ThaiFlashCards
//
//  Created by Dylan Elliott on 11/9/2023.
//

import Foundation

enum ThaiVowelLength {
    case short
    case long
    
    var title: String {
        switch self {
        case .long: return "long"
        case .short: return "short"
        }
    }
}

struct ThaiVowel {
    let script: String
    let sound: String
    let length: ThaiVowelLength
}

extension ThaiVowel: CardDisplayable {
    static var allCases: [ThaiVowel] = Array<(String, String, ThaiVowelLength)>(arrayLiteral:
        ("-ะ", "a", .short),
        ("-ิ", "i", .short),
        ("-ึ", "eu", .short),
        ("-ุ", "u", .short),
        ("เ-ะ", "e", .short),
        ("แ-ะ", "ae", .short),
        ("โ-ะ", "o", .short),
        ("เ-าะ", "aw", .short),
        ("เ-อะ", "er", .short),
        ("เ-ียะ", "ia", .short),
        ("เ-ือะ", "eua", .short),
        ("-ัวะ", "u", .short),
        ("-า", "aa", .long),
        ("-ี", "ii", .long),
        ("-ือ", "euuh", .long),
        ("-ู", "uu", .long),
        ("เ-", "ee", .long),
        ("แ-", "aae", .long),
        ("โ-", "oo", .long),
        ("-อ", "aw", .long),
        ("เ-อ", "er", .long),
        ("เ-ีย", "ia", .long),
        ("เ-ือ", "eua", .long),
        ("-ัว", "ua", .long),
        ("-ำ", "um", .short),
        ("ไ-", "ai", .long),
        ("ใ-", "ai", .long),
        ("เ-า", "ao", .long),
        ("ฤ", "rue", .short),
        ("ฤา", "rue", .long),
        ("ฦ", "lue", .short),
        ("ฦา", "lue", .long)
    ).map {
        .init(script: $0.0, sound: $0.1, length: $0.2)
    }
    
    var cardContent: CardContent {
        return .init(
            front: .init(.largeText(self.script)),
            back: .init(.largeTextWithFooter(self.sound, self.length.title))
        )
    }
}
