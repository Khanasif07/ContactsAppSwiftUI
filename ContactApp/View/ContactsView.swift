//
//  ContactsView.swift
//  ContactApp
//
//  Created by Asif Khan on 02/04/2025.
//

import SwiftUI

struct ContactsView: View {
    @State private var searchText: String = ""
    @State private var showAddContactView: Bool = false
    
    @State private var contacts:[Contact] = [Contact(id: "1", firstName: "Asif", lastName: "Khan", email: "asif@yopmail.com"),Contact(id: "2", firstName: "karan", lastName: "Kumar", email: "karan@yopmail.com"),Contact(id: "3", firstName: "abhik", lastName: "jawandhiya", email: "abhik@yopmail.com")]
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(contacts){
                    contact in
                    NavigationLink(value: contact) {
                        ContactRowView(contact: contact)
                    }
                }
            }
            .sheet(isPresented: $showAddContactView, onDismiss: {
                //
            }, content: {
                AddContactView().presentationDetents([.height(300)])
            })
            .navigationDestination(for: Contact.self, destination: { contact in
                EditContactView(contact: contact)
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

#Preview {
    ContactsView()
}
