//
//  Binding+Constant.swift
//  ThaiFlashCards
//
//  Created by Dylan Elliott on 18/9/2023.
//

import SwiftUI

extension Binding {
    init(constant: Value) {
        self.init(get: { constant }, set: { _ in })
    }
}
