//
//  CardFace.swift
//  ThaiFlashCards
//
//  Created by Dylan Elliott on 12/9/2023.
//

import Foundation

struct CardFaceModel: Codable, Equatable {
    let content: CardFaceContent
    private let alternateSpokenText: String?
    
    var spokenText: String { alternateSpokenText ?? content.text }
    
    init(_ content: CardFaceContent, alternateSpokenText: String? = nil) {
        self.content = content
        self.alternateSpokenText = alternateSpokenText
    }
}
