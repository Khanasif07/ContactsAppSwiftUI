//
//  AddExpenseSheet.swift
//  ContactApp
//
//  Created by Asif Khan on 07/04/2025.
//

import SwiftUI

struct AddExpenseSheet: View{
    @Environment(\.modelContext)  var context
    @Environment(\.dismiss) private var dismiss
    
    @State private var name: String = ""
    @State private var value: Double = 0.0
    @State private var date: Date = .now
    
    
    
    var body: some View{
        NavigationStack{
            Form{
                TextField("Expense Name", text: $name)
                DatePicker("Date", selection: $date,displayedComponents: .date)
                TextField("Value", value: $value,format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
                
            }.navigationTitle("New Expense")
                .navigationBarTitleDisplayMode(.large)
                .toolbar {
                    ToolbarItemGroup(placement: .topBarLeading, content: {
                        Button("Cancel") {
                            dismiss()
                        }
                    })
                    
                    ToolbarItemGroup(placement: .topBarTrailing, content: {
                        Button("Save") {
                            let expense = Expense(name: name, value: value, date: date)
                            context.insert(expense)
//                            try! context.save()
                            dismiss()
                        }
                    })
                }
        }
    }
}
