//
//  PostView.swift
//  ContactApp
//
//  Created by Asif Khan on 07/04/2025.
//

import SwiftUI
import SwiftData
struct PostView: View {
    @Query(sort: \PostModel.id) var posts:[PostModel]
    
    var body: some View {
        NavigationStack {
            List(posts) { post in
                Text(post.title)
            }
            .navigationTitle("Posts: \(posts.count)")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    PostView()
}
