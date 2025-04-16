//
//  Expense.swift
//  ContactApp
//
//  Created by Asif Khan on 07/04/2025.
//
import Foundation
import SwiftData

@Model
class Expense{
    var name:String
    var date: Date
    var value: Double
    
    init(name: String, value: Double,date: Date) {
        self.name = name
        self.date = date
        self.value = value
    }
    
    convenience init(name: String, value: Double) {
        self.init(name: name, value: value, date: Date())
    }
}
