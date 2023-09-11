//
//  ThaiWord+Questions.swift
//  ThaiFlashCards
//
//  Created by Dylan Elliott on 12/9/2023.
//

import Foundation

extension ThaiWord {
    static var questions: [ThaiWord] {
        [
            ("Where is the nearest ____?", "ที่ใกล้ที่สุดอยู่ที่ไหน"),
            ("Please take me to ______.", "ไป _____ นะครับ/ค่ะ"),
            ("How do I get to the _____?", "ฉันจะไปที่ _____ ได้อย่างไร"),
            ("I want to go to ______.", "ไปที่____"),
            ("Can you head to_______?", "ไปที่____ได้มั๊ย"),
            ("Where is _____?", "อยู่ไหน _____"),
        ]
        .map { .init(script: $0.1, meaning: $0.0.lowercased()) }
    }
}
