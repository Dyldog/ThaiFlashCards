//
//  Card.swift
//  ThaiFlashCards
//
//  Created by Dylan Elliott on 26/8/2023.
//

import SwiftUI

struct Card: View {
    let color: Color
    let model: CardModel
    
    init(color: Color = .white, model: CardModel) {
        self.color = color
        self.model = model
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(color)
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color(white: 0.8))
            
            VStack(alignment: .center) {
                Spacer()
                
                content()
                
                Spacer()
                
                if model.isFlipped {
                    Button {
                        model.onUnflipTap()
                    } label: {
                        Image(systemName: "arrow.uturn.backward")
                            .fontWeight(.bold)
                            .imageScale(.medium)
                    }
                } else {
                    Button {
                        model.onSpeakTap()
                    } label: {
                        Image(systemName: "speaker.wave.2.fill")
                            .fontWeight(.bold)
                            .imageScale(.medium)
                    }
                }
            }
            .padding()
        }
        .aspectRatio(2.0 / 3.0, contentMode: .fit)
        .onTapGesture {
            model.onTap()
        }
    }
    
    private func content() -> some View {
        switch model.isFlipped ? model.backContent : model.frontContent {
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

struct Card_Previews: PreviewProvider {
    private static func makeCard(
        front: CardFace = .largeText(":)"),
        back: CardFace = .regularText("Asfdgdfg ddfjkgn dfgjdngjkdf gndg dfg d gdfg dfg dfg."),
        isFlipped: Bool = false
    ) -> some View {
        Card(model: .init(
            frontContent: front,
            backContent: back,
            isFlipped: isFlipped,
            onTap: {},
            onSpeakTap: {},
            onUnflipTap: {}
        ))
        .frame(maxHeight: .infinity)
        .background(Color.black)
        .previewLayout(.sizeThatFits)
    }
    static var previews: some View {
        Group {
            makeCard(isFlipped: false)
            makeCard(isFlipped: true)
            makeCard(front: .sectionedText([
                ("Hello", "World"),
                ("A Thing:", "sdfsd fjkbn isbdfu isdhubfisduyfbs")
            ]))
            makeCard(front: .largeTextWithFooter("A", "letter"))
        }
    }
}
