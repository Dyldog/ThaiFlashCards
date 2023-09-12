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
                
                CardFace(model: model.isFlipped ? model.backContent : model.frontContent)
                
                Spacer()
                
                if model.isFlipped {
                    Button {
                        model.onUnflipTap()
                    } label: {
                        Image(systemName: "arrow.uturn.backward")
                            .font(.system(size: 24, weight: .bold))
                            .imageScale(.medium)
                    }
                } else {
                    Button {
                        model.onSpeakTap()
                    } label: {
                        Image(systemName: "speaker.wave.2.fill")
                            .font(.system(size: 24, weight: .bold))
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
}

struct Card_Previews: PreviewProvider {
    private static func makeCard(
        front: CardFaceModel = .init(.largeText(":)")),
        back: CardFaceModel = .init(.regularText("Asfdgdfg ddfjkgn dfgjdngjkdf gndg dfg d gdfg dfg dfg.")),
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
            makeCard(front: .init(.sectionedText([
                ("Hello", "World"),
                ("A Thing:", "sdfsd fjkbn isbdfu isdhubfisduyfbs")
            ])))
            makeCard(front: .init(.largeTextWithFooter("A", "letter")))
        }
    }
}
