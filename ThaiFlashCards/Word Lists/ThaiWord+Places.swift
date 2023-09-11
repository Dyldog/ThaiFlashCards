//
//  ThaiWord+Vegetables.swift
//  ThaiFlashCards
//
//  Created by Dylan Elliott on 12/9/2023.
//

import Foundation

extension ThaiWord {
    static var places: [ThaiWord] {
        [
            ("Airport", "สนามบิน"),
            ("Amusement park", "สวนสนุก"),
            ("Apartment", "อพาร์ทเมนต์"),
            ("Bank", "ธนาคาร"),
            ("Beach", "หาดทราย"),
            ("Church", "โบสถ์"),
            ("Cinema", "โรงหนัง"),
            ("Company", "บริษัท"),
            ("Condominium", "คอนโดมิเนียม"),
            ("Desert", "ทะเลทราย"),
            ("Earth", "โลก"),
            ("Embassy", "สถานทูต"),
            ("Factory", "โรงงาน"),
            ("Forest", "ป่า"),
            ("Garage", "อู่ซ่อมรถ"),
            ("Garden", "สวน"),
            ("Guesthouse", "เกสต์เฮาส์"),
            ("Home ", "บ้าน"),
            ("Hospital", "โรงพยาบาล"),
            ("Hotel", "โรงแรม"),
            ("Island", "เกาะ"),
            ("Lake", "ทะเล สาป"),
            ("Lake", "บึง"),
            ("Market", "ตลาด"),
            ("Mountain", "ภูเขา"),
            ("Museum", "พิพิธภัณฑ์"),
            ("Office", "ออฟฟิศ"),
            ("Park", "สวน"),
            ("Post office", "ไปรษณีย์"),
            ("Restaurant", "ร้านอาหาร"),
            ("River", "แม่น้ำ"),
            ("School", "โรงเรียน"),
            ("Sea", "ทะเล"),
            ("Spa", "สปา"),
            ("Superkmarket", "ซูเปอร์มาร์เกต"),
            ("Temple", "วัด"),
            ("University", "มหาวิทยาลัย"),
            ("Waterfall", "น้ำตก"),
            ("Zoo", "สวนสัตว์")
        ]
        .map { .init(script: $0.1, meaning: $0.0.lowercased()) }
    }
}
