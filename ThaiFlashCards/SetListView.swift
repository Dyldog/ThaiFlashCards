//
//  SetListView.swift
//  ThaiFlashCards
//
//  Created by Dylan Elliott on 11/9/2023.
//

import SwiftUI

typealias WordList = (title: String, content: [CardContent])

struct SetListViewModel {
    let lists: [(title: String, content: [WordList])] = [
        ("Letters", [
            ("Consonants", ThaiConsonant.allCases.cardContent),
            ("Vowels", ThaiVowel.allCases.cardContent),
            ("All Letters", ThaiLetter.allCases.cardContent)
        ]),
        ("Words", [
            ("Colours", ThaiWord.colours.cardContent),
            ("Animals", ThaiWord.animals.cardContent),
            ("Fruits & Vegetables", ThaiWord.fruitsAndVegetables.cardContent),
            ("Places", ThaiWord.places.cardContent), 
            ("Household Items", ThaiWord.houseHoldItems.cardContent),
            ("Prepositions", ThaiWord.prepositions.cardContent),
            ("Questions", ThaiWord.questions.cardContent)
        ])
    ]
}

struct SetListView: View {
    let viewModel: SetListViewModel = .init()
    
    var body: some View {
        List {
            ForEach(Array(viewModel.lists.enumerated()), id: \.offset) { offset, section in
                Section(section.title) {
                    ForEach(Array(section.content.enumerated()), id: \.offset) { offset, element in
                        NavigationLink {
                            CardStackView(viewModel: .init(content: element.content))
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
