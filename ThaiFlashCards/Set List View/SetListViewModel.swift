//
//  SetListViewModel.swift
//  ThaiFlashCards
//
//  Created by Dylan Elliott on 18/9/2023.
//

import Foundation
import DylKit

enum SetListRow: Codable, Identifiable {
    case sectionHeader(String)
    case cardSet(CardSet)
    
    var id: String {
        switch self {
        case let .sectionHeader(text): return "HEADER-\(text)"
        case let .cardSet(set): return "SET-\(set.title)-\(set.cards.count)"
        }
    }
}

struct SetListViewModel {
    @UserDefaultable(key: UserData.customLists) var rows: [SetListRow] = [
        .sectionHeader("Letters"),
        .cardSet(.init("Consonants", ThaiConsonant.allCases.cardContent)),
        .cardSet(.init("Vowels", ThaiVowel.allCases.cardContent)),
        .cardSet(.init("All Letters", ThaiLetter.allCases.cardContent)),
        .sectionHeader("Words"),
        .cardSet(.init("Colours", ThaiWord.colours.cardContent)),
        .cardSet(.init("Animals", ThaiWord.animals.cardContent)),
        .cardSet(.init("Fruits & Vegetables", ThaiWord.fruitsAndVegetables.cardContent)),
        .cardSet(.init("Places", ThaiWord.places.cardContent)),
        .cardSet(.init("Household Items", ThaiWord.houseHoldItems.cardContent)),
        .cardSet(.init("Prepositions", ThaiWord.prepositions.cardContent)),
        .cardSet(.init("Questions", ThaiWord.questions.cardContent)),
    ]
    
    mutating func addCustomList(_ name: String) {
        rows.append(.cardSet(.init(title: name, cards: [])))
    }
}
