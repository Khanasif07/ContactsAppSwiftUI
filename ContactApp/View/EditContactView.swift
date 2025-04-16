//
//  EditContactView.swift
//  ContactApp
//
//  Created by Asif Khan on 03/04/2025.
//

import SwiftUI
import SwiftData

struct EditContactView: View {
    //@Environment(ContactViewModel.self) var viewModel
    @Environment(\.modelContext) private var context // ← For CRUD operations
    @EnvironmentObject  var viewModel: ContactViewModel
    @Bindable private var contact: Contact
    @Environment(\.dismiss) var dismiss
    @State private var contactsDataDidChange: Bool = false
    @State private var showExitConfiguration: Bool = false
    @State private var showDeleteConfiguration: Bool = false
    private let originalContact: Contact
    
    init(contact: Contact) {
        self.contact = contact
        self.originalContact = Contact(
            id: contact.id, firstName: contact.firstName,
            lastName: contact.lastName,
            email: contact.email
        )
    }
    
    var body: some View {
        VStack {
            Form{
                TextField( "First Name", text: $contact.firstName)
                TextField( "Last Name", text: $contact.lastName)
                TextField( "Email", text: $contact.email)
                    .keyboardType(.emailAddress).textContentType(.emailAddress)
                    .navigationTitle("Edit Contact").navigationBarTitleDisplayMode(.inline)
            }
            
            Button("Delete"){
                showDeleteConfiguration.toggle()
            }
        }
//        .onChange(of: contact, { oldValue, newValue in
//            //contactsDataDidChange = (newValue != originalContact)
//            contactsDataDidChange =  (newValue.firstName != originalContact.firstName ||
//            newValue.lastName != originalContact.lastName ||
//            newValue.email != originalContact.email)
//        })
        .onChange(of: contact.firstName) { _ in checkForChanges() }
        .onChange(of: contact.lastName) { _ in checkForChanges() }
        .onChange(of: contact.email) { _ in checkForChanges() }
        .alert("Delete Contact?", isPresented: $showDeleteConfiguration, actions: {
            Button("Cancel",role: .cancel) {}
            Button("Delete", role: .destructive) {
                deleteContact()
            }
        })
        .alert("Unsaved Changes", isPresented: $showExitConfiguration, actions: {
            Button("Stay",role: .cancel) {}
            Button("Discard Changes", role: .destructive) {
                dismiss()
            }
        })
        .navigationTitle("Edit Contact")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar{
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") {
                    onCancelSheet()
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    updateContact()
                }
                .disabled(!contactsDataDidChange)
                .opacity(contactsDataDidChange ? 1.0 : 0.0)
                .font(.headline)
            }
        }
    }
}

private extension EditContactView {
    func checkForChanges() {
        contactsDataDidChange = (
            contact.firstName != originalContact.firstName ||
            contact.lastName != originalContact.lastName ||
            contact.email != originalContact.email
        )
    }
    
    func updateContact() {
        self.viewModel.updateContact(contact)
        dismiss()
    }
    
    func deleteContact() {
        self.viewModel.deleteContact(contact)
        dismiss()
    }
    
//    func deleteTasks(at offsets: IndexSet) {
//        for index in offsets {
//            let task = viewModel.contacts[index] // You can access the model like this
//            context.delete(task)
//        }
//    }
    
    func onCancelSheet() {
        if contactsDataDidChange {
            showExitConfiguration =  true
        }else {
            dismiss()
        }
    }
}
//
//#Preview {
//    EditContactView(contact: Contact(id: "1", firstName: "Asif", lastName: "Khan", email: "asif@yopmail.com")).environment(ContactViewModel().self)
//}
