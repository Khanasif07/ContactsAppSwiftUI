//
//  EditContactView.swift
//  ContactApp
//
//  Created by Asif Khan on 03/04/2025.
//

import SwiftUI

struct EditContactView: View {
    @State private var contact: Contact
    @Environment(\.dismiss) var dismiss
    
    init(contact: Contact) {
        self.contact = contact
    }
    
    var body: some View {
        VStack {
            Form{
                TextField( "First Name", text: $contact.firstName)
                TextField( "Last Name", text: $contact.lastName)
                TextField( "Email", text: $contact.email)
                    .keyboardType(.emailAddress).textContentType(.emailAddress)
                    .navigationTitle("Add Contact").navigationBarTitleDisplayMode(.inline)
            }
            
            Button("Delete"){
                
            }
        }
        .navigationTitle("Edit Contact")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar{
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") {
                    dismiss()
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    dismiss()
                }.font(.headline)
            }
        }
    }
}

#Preview {
    EditContactView(contact: Contact(id: "1", firstName: "Asif", lastName: "Khan", email: "asif@yopmail.com"))
}
