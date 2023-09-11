//
//  Animals.swift
//  ThaiFlashCards
//
//  Created by Dylan Elliott on 11/9/2023.
//

import Foundation

extension ThaiWord {
    static var colours: [ThaiWord] {
        [
            ("Red", "สีแดง"),
            ("Orange", "สีส้ม"),
            ("Yellow", "สีเหลือง"),
            ("Green", "สีเขียว"),
            ("Sky blue", "สีฟ้า"),
            ("Blue", "สีน้ำเงิน"),
            ("Purple", "สีม่วง"),
            ("Black", "สีดำ"),
            ("White", "สีขาว"),
            ("Gray", "สีเทา"),
            ("Brown", "สีน้ำตาล"),
            ("Cream", "สีครีม"),
            ("Beige", "สีเนื้อ"),
            ("Transparent", "สีใส"),
            ("Gold", "สีทอง"),
            ("Silver", "สีเงิน"),
            ("Pink", "สีชมพู"),
            ("Khaki", "สีกากี"),
            ("Navy blue", "สีกรม"),
            ("Crimson", "สีเลือดหมู"),
            ("Blonde", "สีบลอนด์"),
            ("Deep pink", "สีบานเย็น"),
            ("Mustard", "สีเหลืองอมส้ม"),
            ("Magenta", "สีแดงอมม่วง"),
            ("Drab", "สีน้ำตาลอมเหลือง")
        ]
        .map { .init(script: $0.1, meaning: $0.0.lowercased()) }
    }
}
