//
//  CardFace.swift
//  ThaiFlashCards
//
//  Created by Dylan Elliott on 11/9/2023.
//

import Foundation

enum CardFace {
    case regularText(String)
    case sectionedText([(title: String, value: String)])
    case largeText(String)
    case largeTextWithFooter(String, String)
    
    var text: String {
        switch self {
        case let .regularText(text): return text
        case let .sectionedText(text): return text.map { "\($0.title): \($0.value)" }.joined(separator: ". ")
        case let .largeText(text): return text
        case let .largeTextWithFooter(text, footer): return "\(text), \(footer)"
        }
    }
}

