//
//  View+ShuffledPosition.swift
//  ThaiFlashCards
//
//  Created by Dylan Elliott on 17/9/2023.
//

import SwiftUI

extension View {
    func shuffledPosition(rotationRange: ClosedRange<Double> = -10 ... 10, positionRange: ClosedRange<Double> = -20 ... 20) -> some View {
        self.rotationEffect(.degrees(.random(in: rotationRange)))
            .offset(.init(
                width: .random(in: positionRange),
                height: .random(in: positionRange)
            ))
    }
}
