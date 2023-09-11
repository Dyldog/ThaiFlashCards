//
//  ThaiWord+FruitsVegetables.swift
//  ThaiFlashCards
//
//  Created by Dylan Elliott on 12/9/2023.
//

import Foundation

extension ThaiWord {
    static var fruitsAndVegetables: [ThaiWord] {
        [
            ("tomato", "มะเขือเทศ"),
            ("lettuce", "ผัก กาดหอม"),
            ("onion", "หอม หัวใหญ่"),
            ("spinach", "ผักขม"),
            ("cucumber", "แตงกวา"),
            ("potato", "มันฝรั่ง"),
            ("sweet potato", "มัน เทศ"),
            ("broccoli", "บร็อคโคลี่"),
            ("cauliflower", "กะหล่ำดอก"),
            ("beans", "ถั่ว"),
            ("mushroom", "เห็ด"),
            ("corn", "ข้าว โพด"),
            ("garlic", "กระเทียม"),
            ("carrot", "แครอท"),
            ("pumpkin", "ฟัก ทอง"),
            ("asparagus", "หน่อไม้ฝรั่ง"),
            ("shallot", "หอม เล็ก"),
            ("morning glory", "ผักบุ้ง"),
            ("chilli", "พริก"),
            ("lemongrass", "ตะไคร้"),
            ("cabbage", "กะหล่ำปลี"),
            ("ginger", "ขิง"),
            ("bamboo shoots ", "หน่อไม้"),
            ("watercress", "ผักน้ำ"),
            ("eggplant", "มะเขือยาว"),
            ("mango", "มะม่วงสุก"),
            ("young coconut", "มะพร้าวอ่อน"),
            ("pineapple", "สับปะรด"),
            ("banana", "กล้วย"),
            ("papaya", "มะละกอ"),
            ("durian", "ทุเรียน"),
            ("mangosteen", "มังคุด"),
            ("rambutan", "เงาะ"),
            ("longan", "ลำไย"),
            ("rose apple", "ชมพู่"),
            ("guava", "ฝรั่ง"),
            ("dragonfruit", "แก้วมังกร"),
            ("pomelo", "ส้มโอ"),
            ("tamarind", "มะขาม"),
            ("jackfruit", "ขนุน"),
            ("strawberry", "สตรอว์เบอร์รี่"),
            ("lychee", "ลิ้นจี่"),
            ("watermelon", "แตงโม"),
            ("starfruit", "มะ เฟือง"),
            ("persimmon", "ลูกพลับ")
        ]
        .map { .init(script: $0.1, meaning: $0.0.lowercased()) }
    }
}
