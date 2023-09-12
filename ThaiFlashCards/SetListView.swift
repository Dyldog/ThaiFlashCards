//
//  SetListView.swift
//  ThaiFlashCards
//
//  Created by Dylan Elliott on 11/9/2023.
//

import SwiftUI
import DylKit

struct SetListViewModel {
    let lists: [(title: String, content: [CardSet])] = [
        ("Letters", [
            .init("Consonants", ThaiConsonant.allCases.cardContent),
            .init("Vowels", ThaiVowel.allCases.cardContent),
            .init("All Letters", ThaiLetter.allCases.cardContent)
        ]),
        ("Words", [
            .init("Colours", ThaiWord.colours.cardContent),
            .init("Animals", ThaiWord.animals.cardContent),
            .init("Fruits & Vegetables", ThaiWord.fruitsAndVegetables.cardContent),
            .init("Places", ThaiWord.places.cardContent),
            .init("Household Items", ThaiWord.houseHoldItems.cardContent),
            .init("Prepositions", ThaiWord.prepositions.cardContent),
            .init("Questions", ThaiWord.questions.cardContent)
        ])
    ]
}

struct SetListView: View {
    let viewModel: SetListViewModel = .init()
    
    var body: some View {
        List {
            ForEach(enumerated: viewModel.lists) { offset, section in
                Section(section.title) {
                    ForEach(enumerated: section.content) { offset, element in
                        NavigationLink {
                            CardSetView(element)
                        } label: {
                            Text(element.title)
                                .font(.largeTitle)
                                .fontWeight(.bold)
                        }
                        
                    }
                }
            }
        }
    }
}
