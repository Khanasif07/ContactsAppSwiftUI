//
//  Post.swift
//  ContactApp
//
//  Created by Asif Khan on 07/04/2025.
//
import Foundation
struct Post: Decodable{
    var userId: Int
    var id: Int
    var title: String
    var body: String
}

struct PostLoader{
    
    func loadPosts() async throws -> [Post] {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return []}
        let (data,repponse) = try await URLSession.shared.data(from: url)
        guard let httpResponse = repponse as? HTTPURLResponse, httpResponse.statusCode == 200 else {return []}
        let posts = try JSONDecoder().decode([Post].self, from: data)
        return posts
    }
}
