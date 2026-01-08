//
//  FeedOverlayView.swift
//  TikTokClone
//
//  Created by giorgi gotsadze on 1/8/26.
//

import SwiftUI

struct FeedOverlayView: View {
    let isLiked: Bool
    let likeCount: Int
    let onLikeTap: () -> Void

    var body: some View {
        VStack {
            Spacer()
            HStack(alignment: .bottom) {
                leftInfo
                Spacer()
                rightActions
            }
            .padding(.bottom, 85)
        }
        .padding()
    }

    private var leftInfo: some View {
        VStack(alignment: .leading) {
            Text("giorgi gotsdzeuudiasjdiuasdjias")
                .fontWeight(.semibold)
            Text("Some Description")
        }
        .foregroundStyle(.white)
        .font(.subheadline)
    }

    private var rightActions: some View {
        VStack(spacing: 28) {
            Circle()
                .frame(width: 48, height: 48)
                .foregroundColor(.gray)

            VStack {
                Button(action: onLikeTap) {
                    Image(systemName: isLiked ? "heart.fill" : "heart")
                        .resizable()
                        .frame(width: 28, height: 25)
                        .foregroundColor(isLiked ? .red : .white)
                }

                Text("\(likeCount)")
                    .font(.caption)
                    .foregroundStyle(.white)
                    .bold()
            }

            icon("ellipsis.bubble.fill", "27")
            icon("bookmark.fill")
            icon("arrowshape.turn.up.right.fill")
        }
    }

    private func icon(_ name: String, _ count: String? = nil) -> some View {
        VStack {
            Image(systemName: name)
                .resizable()
                .frame(width: 28, height: 25)
                .foregroundColor(.white)

            if let count {
                Text(count)
                    .font(.caption)
                    .foregroundStyle(.white)
                    .bold()
            }
        }
    }
}
