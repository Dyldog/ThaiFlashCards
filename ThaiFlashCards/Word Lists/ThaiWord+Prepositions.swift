//
//  ThaiWord+Prepositions.swift
//  ThaiFlashCards
//
//  Created by Dylan Elliott on 11/9/2023.
//

import Foundation

extension ThaiWord {
    static var prepositions: [ThaiWord] {
        [
            ("In", "ใน"),
            ("Out", "นอก"),
            ("Above", "เหนือ"),
            ("On", "เกี่ยวกับ"),
            ("On", "บน"),
            ("Behind", "ข้างหลัง"),
            ("Near", "ใกล้"),
            ("By", "โดย"),
            ("Down", "ลง"),
            ("Between", "ระหว่าง"),
            ("From", "จาก"),
            ("Into", "เข้าไป"),
            ("Under", "ภายใต้"),
            ("With", "ด้วย"),
            ("With", "กับ"),
            ("Within", "ภายใน"),
            ("To", "ถึง"),
            ("Toward", "ไปทาง"),
            ("Beneath", "ภายใต้"),
            ("Beside", "ข้างๆ"),
            ("Before", "ก่อน"),
            ("Across", "ข้าม")
        ]
        .map { .init(script: $0.1, meaning: $0.0.lowercased()) }
    }
}
