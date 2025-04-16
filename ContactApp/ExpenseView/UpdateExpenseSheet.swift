//
//  UpdateExpenseSheet.swift
//  ContactApp
//
//  Created by Asif Khan on 07/04/2025.
//

import SwiftUI

struct UpdateExpenseSheet: View {
    @Environment(\.modelContext)  var context
    @Environment(\.dismiss) private var dismiss
    
    @Bindable var expense: Expense
   
    var body: some View{
        NavigationStack{
            Form{
                TextField("Expense Name", text: $expense.name)
                DatePicker("Date", selection: $expense.date,displayedComponents: .date)
                TextField("Value", value: $expense.value,format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
                
            }.navigationTitle("Update Expense")
                .navigationBarTitleDisplayMode(.large)
                .toolbar {
                    ToolbarItemGroup(placement: .topBarTrailing, content: {
                        Button("Done") {
                            dismiss()
                        }
                    })
                }
        }
    }
}

//#Preview {
//    UpdateExpenseSheet(expense: <#Expense#>)
//}
