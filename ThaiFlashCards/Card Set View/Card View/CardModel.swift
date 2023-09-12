//
//  CardModel.swift
//  ThaiFlashCards
//
//  Created by Dylan Elliott on 11/9/2023.
//

import Foundation
import SwiftUI

struct CardModel: Identifiable {
    let id: UUID = .init()
    let frontContent: CardFaceModel
    let backContent: CardFaceModel
    var isFlipped: Bool
    let onTap: () -> Void
    let onSpeakTap: () -> Void
    let onUnflipTap: () -> Void
}
