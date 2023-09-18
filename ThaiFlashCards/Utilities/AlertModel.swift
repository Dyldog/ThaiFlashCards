//
//  AlertModel.swift
//  ThaiFlashCards
//
//  Created by Dylan Elliott on 18/9/2023.
//

import Foundation
import SwiftUI

struct AlertAction {
    let title: String
    let action: () -> Void
}

struct AlertModel: Identifiable {
    let id: UUID = .init()
    let title: String
    let message: String
    var primaryAction: Alert.Button
    var secondaryAction: Alert.Button
}

extension View {
    func alert(_ model: Binding<AlertModel?>) -> some View {
        return self.alert(item: model) { item in
            Alert(
                title: Text(item.title),
                message: Text(item.message),
                primaryButton: item.primaryAction,
                secondaryButton: item.secondaryAction
            )
        }
    }
}
