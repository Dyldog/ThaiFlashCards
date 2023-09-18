//
//  CardSetRow.swift
//  ThaiFlashCards
//
//  Created by Dylan Elliott on 18/9/2023.
//

import SwiftUI

extension SetListView {
    struct CardSetRow: View {
        let item: Binding<CardSet>
        
        init(item: Binding<CardSet>) {
            self.item = item
        }
        
        var body: some View {
            NavigationLink {
                CardSetView(item)
            } label: {
                HStack {
                    Text(item.wrappedValue.title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    ZStack {
                        Image(systemName: "rectangle.portrait.fill").font(.system(size: 36))
                        Text("\(item.cards.count)").font(.footnote).fontWeight(.bold).foregroundColor(.white)
                    }.shuffledPosition(rotationRange: -5 ... 5, positionRange: -3 ... 3)
                }
            }
        }
    }
}
