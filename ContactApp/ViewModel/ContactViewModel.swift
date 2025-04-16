//
//  ContactViewModel.swift
//  ContactApp
//
//  Created by Asif Khan on 03/04/2025.
//
//import Observation
import SwiftData
import Foundation
//@Observable
//class ContactViewModel{
//    var contacts:[Contact] = []
//    init (){
//        fetchContacts()
//    }
//    
//    func fetchContacts(){
//        contacts =  [Contact(id: "1", firstName: "Asif", lastName: "Khan", email: "asif@yopmail.com"),Contact(id: "2", firstName: "karan", lastName: "Kumar", email: "karan@yopmail.com"),Contact(id: "3", firstName: "abhik", lastName: "jawandhiya", email: "abhik@yopmail.com")]
//    }
//    
//    func addcontact(_ contact:Contact){
//        contacts.append(contact)
//    }
//    
//    func deleteContact(_ contact:Contact){
//        
//        guard let index = self.contacts.firstIndex(where: { contacts in
//            return contacts.id == contact.id
//        }) else { return }
//        contacts.remove(at: index)
//    }
//    
//    func updateContact(_ contact:Contact){
//        guard let index = self.contacts.firstIndex(where: { contacts in
//            return contacts.id == contact.id
//        })  else { return }
//        contacts[index] = contact
//    }
//    
//    //func searchResults
//    func searchResults(for searchText: String) -> [Contact] {
//        guard !searchText.isEmpty else {
//            return contacts
//        }
//        return contacts.filter {
//            $0.firstName.lowercased().contains(searchText.lowercased()) || $0.lastName.lowercased().contains(searchText.lowercased()) ||
//            $0.email.lowercased().contains(searchText.lowercased())
//        }
//    }
//
//}

@MainActor
class ContactViewModel: ObservableObject {
    @Published var contacts: [Contact] = []

    private var context: ModelContext

    init(context: ModelContext) {
        self.context = context
        fetchTasks()
    }

    func fetchTasks() {
        do {
            let descriptor = FetchDescriptor<Contact>()
            contacts = try context.fetch(descriptor)
        } catch {
            print("❌ Failed to fetch tasks: \(error)")
        }
    }
    
    func addcontact(_ contact:Contact){
        contacts.append(contact)
    }
    
    func deleteContact(_ contact:Contact){
        
        guard let index = self.contacts.firstIndex(where: { contacts in
            return contacts.id == contact.id
        }) else { return }
        contacts.remove(at: index)
    }
    
    func updateContact(_ contact:Contact){
        guard let index = self.contacts.firstIndex(where: { contacts in
            return contacts.id == contact.id
        })  else { return }
        contacts[index] = contact
    }
    
    //func searchResults
    func searchResults(for searchText: String) -> [Contact] {
        guard !searchText.isEmpty else {
            return contacts
        }
        return contacts.filter {
            $0.firstName.lowercased().contains(searchText.lowercased()) || $0.lastName.lowercased().contains(searchText.lowercased()) ||
            $0.email.lowercased().contains(searchText.lowercased())
        }
    }
}
