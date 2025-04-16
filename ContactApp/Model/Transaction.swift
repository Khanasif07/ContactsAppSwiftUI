//
//  Transaction.swift
//  ContactApp
//
//  Created by Asif Khan on 13/04/2025.
//
import Foundation
import SwiftUI
struct Transaction {
    let id: String
    let amount: Double
    let date: Date
}

class DataModel: ObservableObject {
    @Published var transactions : [Transaction] = []
    @Published var counter : Int = 0
}

struct ParentView: View {
    @StateObject var dataModel = DataModel()
    var body: some View {
        ChildView(dataModel: dataModel)
    }
}

struct ChildView: View {
    @ObservedObject var dataModel: DataModel
    var body: some View {
        Text("Hello, World!")
            .onAppear {
                self.dataModel.counter += 1
            }
    }
}
