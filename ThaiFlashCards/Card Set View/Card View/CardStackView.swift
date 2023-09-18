//
//  ContentView.swift
//  ThaiFlashCards
//
//  Created by Dylan Elliott on 26/8/2023.
//

import SwiftUI
import DylKit

struct CardStackView: View {
    @ObservedObject var stack: CardStack
    @State var speaker: Speaker
    @Binding var muted: Bool
    
    init(stack: CardStack, shuffled: Bool = true, muted: Binding<Bool>) {
        self.stack = stack
        self._muted = muted
        self._speaker = .init(initialValue: .init())
    }
    
    var body: some View {
        HStack(alignment: .center) {
            Spacer()
            ZStack {
                if stack.isEmpty {
                    Text("Add some cards by tapping the plus button")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: 200)
                } else {
                    Button {
                        stack.reset()
                    } label: {
                        Image(systemName: "arrow.counterclockwise")
                            .tint(.white)
                            .font(.system(size: 32, weight: .bold))
                    }
                }
    
                ForEach(enumerated: stack.remainingCards) { index, card in
                    TextCardView(
                        color:.init(white: brightness(forCardAtIndex: index)),
                        model: .init(
                            frontContent: card.front,
                            backContent: card.back,
                            isFlipped: stack.cardIsFlipped(card),
                            onTap: { stack.topTapped(onNewCard: { _ in speakTop() }) },
                            onSpeakTap: { speaker.speak(stack.visibleFace(for: card).spokenText) },
                            onUnflipTap: { stack.flipTop() }
                        )
                    )
                    .shuffledPosition()
                    .animation(.easeOut(duration: 0.2))
                }
            }
            .frame(height: 300)
            
            Spacer()
        }
        .frame(maxHeight: .infinity)
        .background(Color.black)
        .onAppear {
            speakTop()
        }
    }
    
    private func speakTop() {
        guard !muted else { return }
        guard let top = stack.topCard else { return }
        speaker.speak(stack.visibleFace(for: top).spokenText)
    }
    
    private func brightness(forCardAtIndex index: Int) -> Double {
        let numCards: Double = Double(stack.remainingCards.count)
        guard numCards > 1 else { return 1 }
        let brightnessStep = 1.0 / 100.0
        let distanceFromTop: Double = numCards - Double(index)
        let brightness = 1.0 - distanceFromTop * brightnessStep
        return max(brightness, 0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CardStackView(stack: .init(cards: ThaiLetter.allCases.cardContent, shuffled: true), muted: .init(constant: false))
            .previewLayout(.device)
    }
}
