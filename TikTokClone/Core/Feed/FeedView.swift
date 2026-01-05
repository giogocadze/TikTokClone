//
//  FeedView.swift
//  TikTokClone
//
//  Created by giorgi gotsadze on 1/5/26.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        ScrollView {
            LazyVStack (spacing : 0) {
                ForEach( 0 ..< 10) { post in
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
