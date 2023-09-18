//
//  TextCardView.swift
//  ThaiFlashCards
//
//  Created by Dylan Elliott on 18/9/2023.
//

import SwiftUI

struct TextCardView: View {
    let color: Color
    let model: CardModel
    
    init(color: Color = .white, model: CardModel) {
        self.color = color
        self.model = model
    }
    
    var body: some View {
        CardView(color: color) {
            VStack(alignment: .center) {
                Spacer()
                
                CardFaceView(model: model.isFlipped ? model.backContent : model.frontContent)
                
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
        }
        .onTapGesture {
            model.onTap()
        }
    }
}
