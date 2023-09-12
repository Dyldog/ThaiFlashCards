//
//  CardFace.swift
//  ThaiFlashCards
//
//  Created by Dylan Elliott on 12/9/2023.
//

import SwiftUI

struct CardFace: View {
    let model: CardFaceModel
    
    var body: some View {
        switch model.content {
        case let .regularText(text):
            return AnyView(
                Text(text)
                    .multilineTextAlignment(.center)
            )
        case let .sectionedText(sections):
            return AnyView(VStack(spacing: 30) {
                ForEach(sections, id: \.title) { section in
                    VStack(spacing: 0) {
                        Text(section.title)
//                            .font(.footnote)
                        Text(section.value)
                            .font(.system(size: 60))
                            .fontWeight(.bold)
                            .minimumScaleFactor(0.1)
                            .lineLimit(1)
                    }
                }
            })
        case let .largeText(text):
            return AnyView(Text(text)
                    .font(.system(size: 120))
                    .fontWeight(.bold)
                    .minimumScaleFactor(0.1)
                    .lineLimit(1)
                )
        case let .largeTextWithFooter(text, footer):
            return AnyView(VStack {
                Text(text)
                    .font(.system(size: 60))
                    .fontWeight(.bold)
                    .minimumScaleFactor(0.1)
                    .lineLimit(10)
                
                Text(footer)
//                    .font(.footnote)
            })
        }
    }
}
