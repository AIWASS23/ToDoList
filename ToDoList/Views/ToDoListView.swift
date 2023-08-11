//
//  ToDOListView.swift
//  ToDoList
//
//  Created by Marcelo De Araújo on 07/05/23.
//

import SwiftUI
import FirebaseFirestoreSwift

struct ToDoListView: View {

    @StateObject var viewModel: ToDoListViewModel
    @FirestoreQuery var items: [ToDoListItem]

    init(userId: String) {
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/todos"
        )
        self._viewModel = StateObject(
            wrappedValue: ToDoListViewModel(userId: userId))
    }

    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            Button("Delete") {
                                viewModel.delete(id: item.id)
                            }
                            .tint(.red)
                        }
                }
                .listStyle(PlainListStyle())

            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")

                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(
                    newItemPresented: $viewModel.showingNewItemView
                )
            }
        }
    }
}

struct ToDOListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userId: "qfcoCO2fMYVCGGPsSovNgW2puIV2")
    }
}
