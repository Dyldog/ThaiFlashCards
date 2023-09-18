//
//  AddCardView.swift
//  ThaiFlashCards
//
//  Created by Dylan Elliott on 17/9/2023.
//

import SwiftUI

struct AddCardView: View {
    @State var frontText: String
    @State var backText: String
    let onAdd: (CardContent?) -> Void
    
    @State var error: String? = nil
    
    init(frontText: String = "", backText: String = "", onAdd: @escaping (CardContent?) -> Void) {
        self.frontText = frontText
        self.backText = backText
        self.onAdd = onAdd
    }
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                CardView {
                    TextField("", text: $frontText)
                        .font(.system(size: 120).bold())
                        .minimumScaleFactor(0.1)
                        .lineLimit(1)
                        .multilineTextAlignment(.center)
                }
                .shuffledPosition()
                
                CardView {
                    TextField("", text: $backText)
                        .font(.system(size: 120).bold())
                        .minimumScaleFactor(0.1)
                        .lineLimit(1)
                        .multilineTextAlignment(.center)
                }
                .shuffledPosition()
            }
            .padding()
            
            HStack {
                Button(title: "Cancel", color: .red) {
                    onAdd(nil)
                }
                
                Button(title: "Add", color: .blue) {
                    guard !frontText.isEmpty else { error = "Front text is empty"; return }
                    guard !backText.isEmpty else { error = "Back text is empty"; return }
                    
                    onAdd(.init(
                        front: .init(.largeText(frontText)),
                        back: .init(.largeText(backText))
                    ))
                }
            }
            .padding(16)

            Spacer()
        }
        .background(Color.black)
        .alert(item: $error) {
            Alert(title: Text("Error"), message: Text($0))
        }
    }
}

extension AddCardView {
    struct Button: View {
        let title: String
        let color: Color
        let action: () -> Void
        
        var body: some View {
            SwiftUI.Button {
                action()
            } label: {
                Text(title)
                    .padding(8)
            }
            .frame(maxWidth: .infinity)
            .background(color.opacity(0.4))
            .foregroundColor(color)
            .cornerRadius(8)
        }
    }
}
