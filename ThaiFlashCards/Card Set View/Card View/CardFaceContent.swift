//
//  CardFace.swift
//  ThaiFlashCards
//
//  Created by Dylan Elliott on 11/9/2023.
//

import Foundation

enum CardFaceContent: Codable {
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
    
    enum CodingKeys: String, CodingKey {
        case regularTextString
        case sectionedTextDict
        case largeTextString
        case largeTextFooter
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if let regularTextString = try container.decodeIfPresent(String.self, forKey: .regularTextString) {
            self = .regularText(regularTextString)
        } else if let sectionedTextDict = try container.decodeIfPresent([String: String].self, forKey: .sectionedTextDict) {
            self = .sectionedText(sectionedTextDict.map { ($0.key, $0.value) })
        } else if let largeTextString = try container.decodeIfPresent(String.self, forKey: .largeTextString) {
            if let footer = try container.decodeIfPresent(String.self, forKey: .largeTextFooter) {
                self = .largeTextWithFooter(largeTextString, footer)
            } else {
                self = .largeText(largeTextString)
            }
        } else {
            throw DecodingError.valueNotFound(CardFaceContent.self, .init(codingPath: [], debugDescription: "Could not decode value"))
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        switch self {
        case .regularText(let string): try container.encode(string, forKey: .regularTextString)
        case .sectionedText(let array): try container.encode(array.reduce(into: [:], { $0[$1.title] = $1.value}), forKey: .sectionedTextDict)
        case .largeText(let string): try container.encode(string, forKey: .largeTextString)
        case .largeTextWithFooter(let string, let footer):
            try CardFaceContent.largeText(string).encode(to: encoder)
            try container.encode(footer, forKey: .largeTextFooter)
        }
    }
}

