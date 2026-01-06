//
//  FeedView.swift
//  TikTokClone
//
//  Created by giorgi gotsadze on 1/5/26.
//

import SwiftUI

struct FeedView: View {
    @StateObject var viewModel =  FeedViewModel()
    var body: some View {
            ScrollView {
            LazyVStack (spacing : 0) {
                ForEach(viewModel.posts) { post in
                    FeedCell(post : post)
                }
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.paging)
        .ignoresSafeArea()
    }
}

#Preview {
    FeedView()
}
