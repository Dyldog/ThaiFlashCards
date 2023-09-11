//
//  ContentView.swift
//  ThaiFlashCards
//
//  Created by Dylan Elliott on 26/8/2023.
//

import SwiftUI
import AVKit

class CardStackViewModel: ObservableObject {
    @Published private(set) var cards: [CardModel]
    var cardIsFlipped: Bool { cards.last?.isFlipped ?? false }
    
    init(content: [CardContent], shuffled: Bool = true) {
        cards = []
        cards = content.if(shuffled) { $0.shuffled() }
            .map {
                .init(
                    frontContent: $0.front,
                    backContent: $0.back,
                    isFlipped: false,
                    onTap: { [weak self] in
                        self?.topCardTapped()
                    }, onSpeakTap: { [weak self] in
                        self?.speakTopCard()
                    }, onUnflipTap: { [weak self] in
                        self?.topCardUnflipTapped()
                    }
                )
        }
    }
    
    func onAppear() {
        speakTopCard()
    }
    
    private func topCardTapped() {
        guard let index = cards.indices.last else { return }
        
        switch cards[index].isFlipped {
        case false:
            cards[index].isFlipped = true
        case true:
            cards.remove(at: index)
            speakTopCard()
        }
    }
    
    var speechSynth: AVSpeechSynthesizer?
    private func speakTopCard() {
        guard let index = cards.indices.last else { return }
        let card = cards[index]
        let text = (card.isFlipped ? card.backContent : card.frontContent).text
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "th")

        speechSynth = AVSpeechSynthesizer()
        speechSynth?.speak(utterance)
    }
    private func topCardUnflipTapped() {
        guard let index = cards.indices.last else { return }
        cards[index].isFlipped = false
    }
}

struct CardStackView: View {
    @StateObject var viewModel: CardStackViewModel
    
    var body: some View {
        HStack(alignment: .center) {
            Spacer()
            ZStack {
                ForEach(Array(viewModel.cards.enumerated()), id: \.element.id) { index, card in
                    
                    Card(
                        color:.init(white: brightness(forCardAtIndex: index)),
                        model: card
                    )
                    .rotationEffect(.degrees(.random(in: -10 ... 10)))
                    .offset(.init(
                        width: .random(in: -20 ... 20),
                        height: .random(in: -20 ... 20)
                    ))

                }
            }
            .frame(height: 300)
            
            Spacer()
        }
        .frame(maxHeight: .infinity)
        .background(Color.black)
        .onAppear {
            viewModel.onAppear()
        }
    }
    
    private func brightness(forCardAtIndex index: Int) -> Double {
        let numCards: Double = Double(viewModel.cards.count)
        guard numCards > 1 else { return 1 }
        let brightnessStep = 1.0 / 100.0
        let distanceFromTop: Double = numCards - Double(index)
        let brightness = 1.0 - distanceFromTop * brightnessStep
        return max(brightness, 0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CardStackView(viewModel: .init(content: ThaiLetter.allCases.cardContent))
            .previewLayout(.device)
    }
}
