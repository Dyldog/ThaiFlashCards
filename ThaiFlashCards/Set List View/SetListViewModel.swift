//
//  SetListViewModel.swift
//  ThaiFlashCards
//
//  Created by Dylan Elliott on 18/9/2023.
//

import Foundation
import DylKit

struct SetListViewModel {
    var lists: [SetListSection] = [
        .init(title: "Letters", sets: [
            .init("Consonants", ThaiConsonant.allCases.cardContent),
            .init("Vowels", ThaiVowel.allCases.cardContent),
            .init("All Letters", ThaiLetter.allCases.cardContent)
        ]),
        .init(title: "Words", sets: [
            .init("Colours", ThaiWord.colours.cardContent),
            .init("Animals", ThaiWord.animals.cardContent),
            .init("Fruits & Vegetables", ThaiWord.fruitsAndVegetables.cardContent),
            .init("Places", ThaiWord.places.cardContent),
            .init("Household Items", ThaiWord.houseHoldItems.cardContent),
            .init("Prepositions", ThaiWord.prepositions.cardContent),
            .init("Questions", ThaiWord.questions.cardContent)
        ])
    ]
    
    @UserDefaultable(key: UserData.customLists) var customLists: [CardSet] = []
    
    mutating func addCustomList(_ name: String) {
        customLists.append(.init(title: name, cards: []))
    }
}
