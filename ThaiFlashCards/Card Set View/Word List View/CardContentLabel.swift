//
//  CardContentLabel.swift
//  ThaiFlashCards
//
//  Created by Dylan Elliott on 12/9/2023.
//

import SwiftUI

struct CardContentLabel: View {
    let face: CardFaceModel
    var body: some View {
        switch face.content {
        case let .regularText(text):
            return AnyView(Text(text))
        case let .sectionedText(sections):
            return AnyView(VStack {
                ForEach(sections) { section in
                    HStack {
                        Text(section.title)
                        Text(section.value)
                    }
                }
            })
        case let .largeText(text):
            return AnyView(Text(text))
        case let .largeTextWithFooter(text, footer):
            return AnyView(Text("\(text) (\(footer))"))
        }
    }
}
