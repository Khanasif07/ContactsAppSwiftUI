//
//  ContactsView.swift
//  ContactApp
//
//  Created by Asif Khan on 02/04/2025.
//

import SwiftUI
import SwiftData

struct ContactsView: View {
    @Environment(\.modelContext) private var context // ← For CRUD operations
    @StateObject private var viewModel: ContactViewModel
    @State private var searchText: String = ""
    @State private var showAddContactView: Bool = false
    var searchResults: [Contact] {
        return viewModel.searchResults(for: searchText)
    }
    init(context: ModelContext) {
        _viewModel = StateObject(wrappedValue: ContactViewModel(context: context))
    }
   
    var body: some View {
        NavigationStack{
            List {
                ForEach(searchResults){
                    contact in
                    NavigationLink(value: contact) {
                        ContactRowView(contact: contact)
//                            .swipeActions {
//                                Button(action: {
////                                    viewModel.deleteContact(contact)
//                                    
//                                }) {
//                                    Label("Delete", systemImage: "trash")
//                                }.tint(.red)
//                            }
                    }
                }
                .onDelete(perform: deleteTasks)
            }
            .sheet(isPresented: $showAddContactView, onDismiss: {
                //
            }, content: {
                AddContactView()
                    .environmentObject(viewModel)
                    .presentationDetents([.height(300)])
            })
            .navigationDestination(for: Contact.self, destination: { contact in
                EditContactView(contact: contact)
                    .environmentObject(viewModel)
            })
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button{
                        showAddContactView.toggle()
                    }label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .navigationTitle("Contacts")
        }.searchable(text:$searchText, prompt: "Search")
    }
}

extension ContactsView {
    func deleteTasks(at offsets: IndexSet) {
        for index in offsets {
            let task = viewModel.contacts[index] // You can access the model like this
            context.delete(task)
        }
    }
}
//
//#Preview {
//    ContactsView()
//}
