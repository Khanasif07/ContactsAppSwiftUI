//
//  Contact.swift
//  ContactApp
//
//  Created by Asif Khan on 02/04/2025.
//
import Foundation

struct Contact: Identifiable, Hashable{
    let id: String
    var firstName: String
    var lastName: String
    var email: String
    
    var initials: String {
        let first =  firstName.prefix(1)
        let last =  lastName.prefix(1)
        return "\(first)\(last)".uppercased()
    }
}
