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
    }
    
    @State var mode: Mode = .cards
    @State var cardView: CardStackView
    @State var listView: WordListView
    
    var currentView: some View {
        switch mode {
        case .cards: return AnyView(cardView)
        case .list: return AnyView(listView)
        }
    }
    
    var currentSwitchButtonImage: Image {
        let name: String
        
        switch mode {
        case .cards: name = "list.bullet"
        case .list: name = "note.text"
        }
        
        return Image(systemName: name)
    }
    
    init(_ set: CardSet) {
        self.cardView = .init(viewModel: .init(content: set.cards))
        self.listView = .init(viewModel: .init(title: set.title, cards: set.cards))
    }
    
    var body: some View {
        currentView
            .toolbar {
                ToolbarItem {
                    Button {
                        switchModes()
                    } label: {
                        currentSwitchButtonImage
                    }

                }
            }
            .navigationBarTitleDisplayMode(mode == .list ? .automatic : .large)
    }
    
    func switchModes() {
        if mode == .cards {
            mode = .list
        } else {
            mode = .cards
        }
    }
}

