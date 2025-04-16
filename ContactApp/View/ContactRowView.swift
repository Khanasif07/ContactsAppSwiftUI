//
//  ContactRowView.swift
//  ContactApp
//
//  Created by Asif Khan on 02/04/2025.
//

import SwiftUI

struct ContactRowView: View {
    let contact: Contact
    
    var body: some View {
        HStack {
            Text("\(String(describing: contact.initials))").fontWeight(.bold).foregroundColor(.gray).foregroundStyle(.white).frame(width: 48,height: 48).background(Color(.systemGray6)).clipShape(.circle)
            
            VStack(alignment: .leading) {
                Text("\(contact.firstName) \(contact.lastName)")
                Text("\(contact.email)").foregroundColor(.gray)
            }
            
            Spacer()
        }
    }
}

#Preview {
    ContactRowView(contact: Contact(id: "2", firstName: "Abhok", lastName: "Jawandhiya", email: "abhik@yopmail.com"))
}
