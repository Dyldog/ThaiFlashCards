//
//  CardSetView.swift
//  ThaiFlashCards
//
//  Created by Dylan Elliott on 12/9/2023.
//

import SwiftUI

struct CardSetView: View {
    enum Mode {
        case cards
        case list
        
        var imageName: String {
            switch self {
            case .cards: return "list.bullet"
            case .list: return "note.text"
            }
        }
    }
    
    @State var mode: Mode = .cards
    @Binding var set: CardSet
    @State var showAddView: Bool = false
    
    init(_ set: Binding<CardSet>) {
        self._set = set
    }
    
    var body: some View {
        ZStack {
            CardStackView(content: set.cards)
                .if(mode != .cards) { $0.hidden() }
            
            WordListView(viewModel: .init(title: set.title, cards: $set.cards))
                .if(mode != .list) { $0.hidden() }
        }
        .toolbar {
            HStack {
                Button {
                    showAddView = true
                } label: {
                    Image(systemName: "plus")
                }
                
                Button {
                    switchModes()
                } label: {
                    Image(systemName: mode.imageName)
                }
            }
        }
        .navigationBarTitleDisplayMode(mode == .list ? .automatic : .large)
        .fullScreenCover(isPresented: $showAddView) {
            AddCardView(onAdd: {
                showAddView = false
                
                if let item = $0 {
                    addCard(item)
                }
            })
        }
    }
    
    func switchModes() {
        if mode == .cards {
            mode = .list
        } else {
            mode = .cards
        }
    }
    
    func addCard(_ card: CardContent) {
        set = .init(title: set.title, cards: set.cards + [card])
    }
}

