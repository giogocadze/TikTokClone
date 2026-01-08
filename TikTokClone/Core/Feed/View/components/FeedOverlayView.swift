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
    let onCommentTap: () -> Void

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

        
            VStack {
                Button(action: onCommentTap) {
                    Image(systemName: "ellipsis.bubble.fill")
                        .resizable()
                        .frame(width: 28, height: 25)
                        .foregroundColor(.white)
                }

                Text("27")
                    .font(.caption)
                    .foregroundStyle(.white)
                    .bold()
            }

            icon("bookmark.fill")
            icon("arrowshape.turn.up.right.fill")
        }
    }

    private func icon(_ name: String) -> some View {
        Image(systemName: name)
            .resizable()
            .frame(width: 28, height: 25)
            .foregroundColor(.white)
    }
}
