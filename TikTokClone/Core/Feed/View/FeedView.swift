//
//  FeedView.swift
//  TikTokClone
//
//  Created by giorgi gotsadze on 1/5/26.
//

import SwiftUI


struct FeedView: View {
    @StateObject var viewModel = FeedViewModel()
    @State private var activePostId: String?

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach(viewModel.posts) { post in
                    FeedCell(
                        post: post,
                        activePostId: $activePostId
                    )
                    .id(post.id)
                }
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.paging)
        .scrollPosition(id: $activePostId)   
        .ignoresSafeArea()
    }
}


#Preview {
    FeedView()
}
