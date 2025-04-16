//
//  PostModel.swift
//  ContactApp
//
//  Created by Asif Khan on 07/04/2025.
//
import Foundation
import SwiftData

@Model
class  PostModel{
    var userId: Int
    var id: Int
    var title: String
    var body: String
    
    init(userId: Int, id: Int, title: String, body: String) {
        self.userId = userId
        self.id = id
        self.title = title
        self.body = body
    }
}
