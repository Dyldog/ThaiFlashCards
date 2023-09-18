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
    let message: String?
    var primaryAction: Alert.Button
    var secondaryAction: Alert.Button
    
    init(title: String, message: String? = nil, primaryAction: Alert.Button, secondaryAction: Alert.Button) {
        self.title = title
        self.message = message
        self.primaryAction = primaryAction
        self.secondaryAction = secondaryAction
    }
}

extension View {
    func alert(_ model: Binding<AlertModel?>) -> some View {
        return self.alert(item: model) { item in
            Alert(
                title: Text(item.title),
                message: item.message.map { Text($0) },
                primaryButton: item.primaryAction,
                secondaryButton: item.secondaryAction
            )
        }
    }
}
