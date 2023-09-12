//
//  WordListView.swift
//  ThaiFlashCards
//
//  Created by Dylan Elliott on 12/9/2023.
//

import SwiftUI
import DylKit

struct WordListViewModel {
    let title: String
    let cards: [CardContent]
    
    init(title: String, cards: [CardContent]) {
        self.title = title
        self.cards = cards.sorted(by: { $0.front.spokenText < $1.front.spokenText })
    }
}

struct WordListRow: View {
    let card: CardContent
    
    var body: some View {
        HStack {
            CardContentLabel(face: card.front)
            Spacer()
            CardContentLabel(face: card.back)
        }
    }
}

struct WordListView: View {
    let viewModel: WordListViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.cards) {
                WordListRow(card: $0)
            }
        }
        .navigationTitle(viewModel.title)
    }
}
