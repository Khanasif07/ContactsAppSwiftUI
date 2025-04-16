//
//  ContactAppApp.swift
//  ContactApp
//
//  Created by Asif Khan on 02/04/2025.
//

import SwiftUI
import SwiftData

@main
struct ContactAppApp: App {
    //let postLoader = PostLoader()
    let container: ModelContainer = {
        let schema = Schema([Expense.self,Contact.self,PostModel.self])
        let configuration = ModelConfiguration()
        let container = try! ModelContainer(for: schema, configurations: [])
        return container
    }()
    
    
    
    var body: some Scene {
        WindowGroup {
            //ContactsView(context: ModelContext(try! ModelContainer(for: Contact.self)))
            ExpenseView()
//            PostView()
//                .task {
//                    do {
//                        let dataImporter = DataImporter(context: container.mainContext,postLoader: postLoader)
//                        try await dataImporter.importData()
//                    }catch {
//                        print(error)
//                    }
//                    
//                }
        }
        .modelContainer(container)
        //.modelContainer(for: [Expense.self,Contact.self]) // needed to inject context for SwiftData
    }
}
