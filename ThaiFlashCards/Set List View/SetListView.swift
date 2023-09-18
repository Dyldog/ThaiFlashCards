//
//  SetListView.swift
//  ThaiFlashCards
//
//  Created by Dylan Elliott on 11/9/2023.
//

import SwiftUI
import DylKit
import TextFieldAlert

struct SetListSection: Identifiable {
    var id: String { title }
    let title: String
    var sets: [CardSet]
}

struct SetListView: View {
    
    @State var viewModel: SetListViewModel = .init()
    
    @State var showAddAlert: Bool = false
    @State var alert: AlertModel?
    
    @ViewBuilder
    func makeRow(_ item: Binding<CardSet>) -> some View {
        NavigationLink {
            CardSetView(item)
        } label: {
            HStack {
                Text(item.wrappedValue.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Spacer()
                
                ZStack {
                    Image(systemName: "rectangle.portrait.fill").font(.system(size: 36))
                    Text("\(item.cards.count)").font(.footnote).fontWeight(.bold).foregroundColor(.white)
                }.shuffledPosition(rotationRange: -5 ... 5, positionRange: -3 ... 3)
            }
        }
    }
    
    var body: some View {
        List {
            ForEach($viewModel.lists) { section in
                Section(section.wrappedValue.title) {
                    ForEach(section.sets) { element in
                        makeRow(element)
                    }
                }
            }
            
            Section("Custom Lists") {
                ForEach($viewModel.customLists) { list in
                    makeRow(list)
                }.onDelete { indices in
                    guard let index = indices.first else { return }
                    let list = viewModel.customLists[index]
                    
                    func doDelete() {
                        viewModel.customLists.remove(atOffsets: indices)
                    }
                    
                    guard !list.cards.isEmpty else { return doDelete() }
                    
                    alert = .init(
                        title: "Are you sure you want to delete \"\(list.title)\"?",
                        message: "This set contains \(list.cards.count) \("cards".pluralise(list.cards.count))",
                        primaryAction: .destructive(Text("Delete"), action: {
                            doDelete()
                        }),
                        secondaryAction: .cancel()
                    )
                }
                
                Button {
                    showAddAlert = true
                } label: {
                    HStack {
                        Spacer()
                        Text("Add").fontWeight(.bold).foregroundColor(.blue)
                        Spacer()
                    }
                }
            }
        }.textFieldAlert(
            title: "Add Custom List",
            textFields: [.init(placeholder: "List name")],
            actions: [.init(title: "OK", closure: { strings in
                guard let name = strings.first, !name.isEmpty else { return }
                viewModel.addCustomList(name)
            })],
            isPresented: $showAddAlert
        )
        .alert($alert)
    }
}
