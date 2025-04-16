//
//  AddContactView.swift
//  ContactApp
//
//  Created by Asif Khan on 02/04/2025.
//

import SwiftUI

struct AddContactView: View {
    @Environment(\.dismiss) var dismiss
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
                        dismiss()
                    }.font(.headline)
                }
            }
        }
    }
}

#Preview {
    AddContactView()
}
