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
    @Binding var cards: [CardContent]
    
    init(title: String, cards: Binding<[CardContent]>) {
        self.title = title
        self._cards = cards
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
            ForEach(viewModel.cards.sorted(by: { $0.front.spokenText < $1.front.spokenText })) {
                WordListRow(card: $0)
            }.onDelete {
                viewModel.cards.remove(atOffsets: $0)
            }
        }
        .navigationTitle(viewModel.title)
    }
}
