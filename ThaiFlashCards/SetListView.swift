//
//  SetListView.swift
//  ThaiFlashCards
//
//  Created by Dylan Elliott on 11/9/2023.
//

import SwiftUI
import DylKit

struct SetListSection: Identifiable {
    var id: String { title }
    let title: String
    let sets: [CardSet]
}

struct SetListViewModel {
    let lists: [SetListSection] = [
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
}

struct SetListView: View {
    let viewModel: SetListViewModel = .init()
    
    @State var modal: AnyView?
    
    @ViewBuilder
    func makeRow(_ item: CardSet) -> some View {
        NavigationLink {
            CardSetView(item)
        } label: {
            Text(item.title)
                .font(.largeTitle)
                .fontWeight(.bold)
        }
    }
    
    var body: some View {
        List {
            ForEach(viewModel.lists) { section in
                Section(section.title) {
                    ForEach(section.sets) { element in
                        makeRow(element)
                    }
                }
            }
            
            Section("Custom Lists") {
                ForEach(viewModel.customLists) { list in
                    makeRow(list)
                }
                
                Button {
                    //
                } label: {
                    HStack {
                        Spacer()
                        Text("Add")
                        Spacer()
                    }
                }
            }
        }
    }
}
