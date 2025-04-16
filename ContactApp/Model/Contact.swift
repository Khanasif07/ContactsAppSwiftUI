//
//  Contact.swift
//  ContactApp
//
//  Created by Asif Khan on 02/04/2025.
//
import Foundation
import SwiftData

@Model
class Contact: Identifiable, Hashable,Equatable{
    var id: String
    var firstName: String
    var lastName: String
    var email: String
    
    var initials: String {
        let first =  firstName.prefix(1)
        let last =  lastName.prefix(1)
        return "\(first)\(last)".uppercased()
    }
    
    init(id: String, firstName: String, lastName: String, email: String) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
    }
}


//@Model
//class ContactData {
//    var id: String
//    var firstName: String
//    var lastName: String
//    var email: String
//
//    init(id: String, firstName: String, lastName: String, email: String) {
//        self.id = id
//        self.firstName = firstName
//        self.lastName = lastName
//        self.email = email
//    }
//}
