//
//  Animals.swift
//  ThaiFlashCards
//
//  Created by Dylan Elliott on 11/9/2023.
//

import Foundation

extension ThaiWord {
    static var animals: [ThaiWord] {
        [
            ("Buffalo", "ควาย"),
            ("Monkey", "ลิง"),
            ("Tiger", "เสือ"),
            ("Leopard", "เสือดาว"),
            ("Cheetah", "เสือชีต้า"),
            ("Zebra", "ม้าลาย"),
            ("Lion", "สิงโต"),
            ("Cat", "แมว"),
            ("Dog", "หมา"),
            ("Mouse", "หนู"),
            ("Horse", "ม้า"),
            ("Cow", "วัว"),
            ("Pig", "หมู"),
            ("Rat", "หนูนา"),
            ("Bird", "นก"),
            ("Butterfly", "ผีเสื้อ"),
            ("Bee", "ผึ้ง"),
            ("Ant", "มด"),
            ("Chicken", "ไก่"),
            ("Duck", "เป็ด"),
            ("Goat", "แพะ"),
            ("Spider", "แมงมุม"),
            ("Frog", "กบ"),
            ("Snail", "หอยทาก"),
            ("Fish", "ปลา"),
            ("Shark", "ปลาฉลาม"),
            ("Dolphin", "ปลาโลมา"),
            ("Whale", "ปลาวาฬ")
        ]
        .map { .init(script: $0.1, meaning: $0.0.lowercased()) }
    }
}
