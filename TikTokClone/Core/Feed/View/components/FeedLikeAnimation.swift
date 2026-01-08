//
//  FeedLikeAnimation.swift
//  TikTokClone
//
//  Created by giorgi gotsadze on 1/8/26.
//


import SwiftUI

struct FeedLikeAnimation: View {
    let position: CGPoint
    let isVisible: Bool

    var body: some View {
        if isVisible {
            Image(systemName: "heart.fill")
                .font(.system(size: 100))
                .foregroundColor(.red)
                .position(position)
                .scaleEffect(isVisible ? 1 : 0.5)
                .opacity(isVisible ? 1 : 0)
                .animation(.easeOut(duration: 0.3), value: isVisible)
        }
    }
}

#Preview {
    FeedLikeAnimation(
        position: CGPoint(x: 200, y: 300),
        isVisible: true
    )
}
