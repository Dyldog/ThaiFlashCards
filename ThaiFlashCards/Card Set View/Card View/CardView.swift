//
//  Card.swift
//  ThaiFlashCards
//
//  Created by Dylan Elliott on 26/8/2023.
//

import SwiftUI

struct CardView<Content: View>: View {
    let color: Color
    let content: () -> Content
    
    init(color: Color = .white, content: @escaping () -> Content) {
        self.color = color
        self.content = content
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(color)
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color(white: 0.8))
            
            content().padding()
        }
        .aspectRatio(2.0 / 3.0, contentMode: .fit)
    }
}

struct Card_Previews: PreviewProvider {
    private static func makeCard(
        front: CardFaceModel = .init(.largeText(":)")),
        back: CardFaceModel = .init(.regularText("Asfdgdfg ddfjkgn dfgjdngjkdf gndg dfg d gdfg dfg dfg.")),
        isFlipped: Bool = false
    ) -> some View {
        TextCardView(model: .init(
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
            makeCard(front: .init(.sectionedText([
                .init(title: "Hello", value: "World"),
                .init(title: "A Thing:", value: "sdfsd fjkbn isbdfu isdhubfisduyfbs")
            ])))
            makeCard(front: .init(.largeTextWithFooter("A", "letter")))
        }
    }
}
