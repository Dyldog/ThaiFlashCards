//
//  CardSetView.swift
//  ThaiFlashCards
//
//  Created by Dylan Elliott on 12/9/2023.
//

import SwiftUI
import DylKit

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
    @State var muted: Bool
    @StateObject var stack: CardStack
    
    init(_ set: Binding<CardSet>) {
        self._muted = .init(initialValue: false)
        self._set = set
        self._stack = .init(wrappedValue: .init(cards: set.wrappedValue.cards, shuffled: true))
    }
    
    var body: some View {
        ZStack {
            if mode == .cards {
                CardStackView(stack: stack, muted: $muted)
            } else if mode == .list {
                WordListView(viewModel: .init(title: set.title, cards: $set.cards))
            }
        }
        .toolbar {
            HStack {
                Button {
                    muted.toggle()
                } label: {
                    Image(systemName: muted ? "speaker.slash.fill" : "speaker.wave.2.fill")
                }
                
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

