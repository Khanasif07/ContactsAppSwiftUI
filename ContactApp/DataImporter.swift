//
//  DataImporter.swift
//  ContactApp
//
//  Created by Asif Khan on 07/04/2025.
//
import Foundation
import SwiftData

struct DataImporter {
    let context: ModelContext
    let postLoader : PostLoader
    
    @MainActor
    public func importData() async throws{
        
        var postDescriptor = FetchDescriptor<PostModel>()
        postDescriptor.fetchLimit = 1
        
        let persistedPosts = try! context.fetch(postDescriptor)
        
        if persistedPosts.isEmpty {
            
            do {
                let posts = try await postLoader.loadPosts()
                if !posts.isEmpty {
                    posts.forEach { post in
                        let postModel = PostModel(userId: post.userId, id: post.id, title: post.title, body: post.body)
                        context.insert(postModel)
                    }
                }
            }catch {
                throw error
            }
        }
    }
}
