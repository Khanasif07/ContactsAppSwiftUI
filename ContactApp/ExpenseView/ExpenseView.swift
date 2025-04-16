//
//  Untitled.swift
//  ContactApp
//
//  Created by Asif Khan on 07/04/2025.
//
import SwiftUI
import SwiftData

struct ExpenseView: View {
    @State private var isShowingItemSheet: Bool = false
    @State private var expenseToEdit: Expense?
    @Query(sort: \Expense.date) var expenses:[Expense]
    @Environment(\.modelContext)  var context
    
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses) { expense in
                    ExpenseCell(expense: expense)
                        .onTapGesture {
                            expenseToEdit = expense
                        }
                }
                .onDelete { indexSet in
                    for index in indexSet{
                        context.delete(expenses[index])
                    }
                }
            }
            .navigationBarTitleDisplayMode(.large)
            .sheet(isPresented: $isShowingItemSheet) {
                AddExpenseSheet()
                    .presentationDetents([.height(300)])
            }
            .sheet(item: $expenseToEdit, content: { expense in
                UpdateExpenseSheet(expense: expense)
                    .presentationDetents([.height(300)])
            })
            .toolbar {
                if !expenses.isEmpty {
                    Button("Add Expense",systemImage: "plus") {
                        isShowingItemSheet = true
                    }
                }
            }
            .overlay {
                if expenses.isEmpty {
                    ContentUnavailableView(label: {
                        Label("No Expenses", systemImage: "list.bullet.rectangle.portrait")
                    }, description: {
                        Text("Start adding expenses to see your list..")
                    }, actions: {
                        Button("Add Expense") {
                            isShowingItemSheet = true
                        }
                    })
                    .offset(y: -60)
                }
            }
        }
    }
}

#Preview {
    ExpenseView()
}
