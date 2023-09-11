//
//  ThaiFlashCardsApp.swift
//  ThaiFlashCards
//
//  Created by Dylan Elliott on 26/8/2023.
//

import SwiftUI

@main
struct ThaiFlashCardsApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                SetListView()
                    .navigationTitle("Thai")
            }
        }
    }
}
