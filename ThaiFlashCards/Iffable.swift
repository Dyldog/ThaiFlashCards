//
//  Iffable.swift
//  ThaiFlashCards
//
//  Created by Dylan Elliott on 11/9/2023.
//

import Foundation

protocol Iffable { }

extension Iffable {
    func `if`(_ condition: Bool, mapper: (Self) -> Self) -> Self {
        return condition ? mapper(self) : self
    }
}
extension Array: Iffable { }
