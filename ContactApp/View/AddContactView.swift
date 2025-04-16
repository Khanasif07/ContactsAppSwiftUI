//
//  AddContactView.swift
//  ContactApp
//
//  Created by Asif Khan on 02/04/2025.
//

import SwiftUI
import SwiftData

struct AddContactView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var context // ← For CRUD operations
//    @Environment(ContactViewModel.self) var viewModel
    @EnvironmentObject  var viewModel: ContactViewModel
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    
    var body: some View {
        NavigationStack {
            Form{
                TextField( "First Name", text: $firstName)
                TextField( "Last Name", text: $lastName)
                TextField( "Email", text: $email)
                    .keyboardType(.emailAddress).textContentType(.emailAddress)
                    .navigationTitle("Add Contact").navigationBarTitleDisplayMode(.inline)
            }.toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        addContact()
                        dismiss()
                    }.font(.headline)
                }
            }
        }
    }
}

private extension AddContactView {

    func addContact() {
        let contact = Contact(id: UUID().uuidString,firstName: firstName, lastName: lastName, email: email)
        //
        context.insert(contact)
        //
        viewModel.addcontact(contact)
    }
}

//#Preview {
//    AddContactView().environment(ContactViewModel())
//}
