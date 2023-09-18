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
    @State var editingWord: CardContent? = nil
    
    var body: some View {
        List {
            ForEach(viewModel.cards.sorted(by: { $0.front.spokenText < $1.front.spokenText })) { card in
                WordListRow(card: card)
                    .onTapGesture {
                        editingWord = card
                    }
            }.onDelete {
                viewModel.cards.remove(atOffsets: $0)
            }
        }
        .navigationTitle(viewModel.title)
        .fullScreenCover(item: $editingWord) { editingCard in
            AddCardView(frontText: editingCard.front.spokenText, backText: editingCard.back.spokenText) { newCard in
                if let newCard = newCard {
                    guard let index = viewModel.cards.firstIndex(where: { $0 == editingCard }) else { return }
                    viewModel.$cards.wrappedValue[index] = newCard
                }
                
                editingWord = nil
            }
        }
    }
}
