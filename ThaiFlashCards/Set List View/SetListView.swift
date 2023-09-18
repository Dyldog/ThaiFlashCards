//
//  SetListView.swift
//  ThaiFlashCards
//
//  Created by Dylan Elliott on 11/9/2023.
//

import SwiftUI
import DylKit
import TextFieldAlert

struct SetListView: View {
    
    @Environment(\.editMode) private var editMode
    @State var viewModel: SetListViewModel = .init()
    
    @State var showAddTypeSheet: Bool = false
    @State var showAddCardSetAlert: Bool = false
    @State var showAddHeaderAlert: Bool = false
    @State var alert: AlertModel?
    
    var body: some View {
        List {
            ForEach(enumerated: $viewModel.rows) { _, row in
                view(for: row)
            }
            .onMove(perform: { viewModel.rows.move(fromOffsets: $0, toOffset: $1) })
            .onDelete { indices in
                guard let index = indices.first else { return }
                let row = viewModel.rows[index]

                func doDelete() {
                    viewModel.rows.remove(atOffsets: indices)
                }

                var title: String?
                var message: String?

                if case let .cardSet(set) = row {
                    guard !set.cards.isEmpty else { return doDelete() }

                    title = "Are you sure you want to delete \"\(set.title)\"?"
                    message = "This set contains \(set.cards.count) \("card".pluralise(set.cards.count))"
                } else if case let .sectionHeader(name) = row {
                    title = "Are you sure you want to delete the header \"\(name)\"?"
                    message = nil
                }

                if let title = title {
                    alert = .init(
                        title: title,
                        message: message,
                        primaryAction: .destructive(Text("Delete"), action: {
                            doDelete()
                        }),
                        secondaryAction: .cancel()
                    )
                }
            }
            
                
            Button {
                showAddTypeSheet = true
            } label: {
                HStack {
                    Spacer()
                    Text("Add").fontWeight(.bold).foregroundColor(.blue)
                    Spacer()
                }
            }
            .moveDisabled(true)
            .disabled(editMode?.wrappedValue.isEditing == true)
        }
        .textFieldAlert(
            title: "Add Card Set",
            textFields: [.init(placeholder: "Set name")],
            actions: [.init(title: "OK", closure: { strings in
                guard let name = strings.first, !name.isEmpty else { return }
                viewModel.addCustomList(name)
            })],
            isPresented: $showAddCardSetAlert
        )
        .textFieldAlert(
            title: "Add Header",
            textFields: [.init(placeholder: "Title")],
            actions: [.init(title: "OK", closure: { strings in
                guard let name = strings.first, !name.isEmpty else { return }
                viewModel.rows.append(.sectionHeader(name))
            })],
            isPresented: $showAddHeaderAlert
        )
        .alert($alert)
        .confirmationDialog("Add", isPresented: $showAddTypeSheet, actions: {
            Button { showAddCardSetAlert = true } label: { Text("Card Set") }
            Button { showAddHeaderAlert = true } label: { Text("Section Header") }
        })
        .toolbar {
            HStack {
                EditButton()
            }
        }

    }
    
    func view(for row: Binding<SetListRow>) -> AnyView {
        switch row.wrappedValue {
        case let .cardSet(set):
            return AnyView(CardSetRow(item: .init(get: {
                return set
            }, set: {
                row.wrappedValue = .cardSet($0)
            })))
        case let .sectionHeader(title):
            return AnyView(Text(title))
        }
    }
}
