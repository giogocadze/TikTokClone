//
//  FeedCell.swift
//  TikTokClone
//
//  Created by giorgi gotsadze on 1/5/26.
//

import SwiftUI
import AVKit

struct FeedCell: View {
    let post: Post
    @Binding var activePostId: String?

    @StateObject private var vm: FeedCellViewModel

    init(post: Post, activePostId: Binding<String?>) {
        self.post = post
        self._activePostId = activePostId
        _vm = StateObject(
            wrappedValue: FeedCellViewModel(videoURL: post.videoUrl)
        )
    }

    var body: some View {
        ZStack {

            CustomVideoPlayer(player: vm.player)
                .containerRelativeFrame([.horizontal, .vertical])
                .allowsHitTesting(false)

            FeedVideoLayer(
                player: vm.player,
                onDoubleTap: { vm.like(at: $0) },
                onSingleTap: {
                    vm.togglePlayback(isActive: activePostId == post.id)
                }
            )

            if !vm.isPlaying {
                Image(systemName: "play.fill")
                    .font(.system(size: 60))
                    .foregroundColor(.white)
            }

            FeedLikeAnimation(
                position: vm.heartPosition,
                isVisible: vm.showHeartAnimation
            )
            
            
            FeedOverlayView(
                isLiked: vm.isLiked,
                likeCount: vm.likeCount,
                commentCount: vm.commentCount,
                onLikeTap: vm.toggleLike,
                onCommentTap: {
                    vm.isCommentsPresented = true
                }
            )
            .sheet(isPresented: $vm.isCommentsPresented) {
                CommentsView(vm: vm)
            }

        }
        .onChange(of: activePostId) { _, newValue in
            newValue == post.id ? vm.play() : vm.pause()
        }
        .onAppear {
            if activePostId == nil {
                activePostId = post.id
            }
        }
    }
}
#Preview {
    FeedCell(
        post: Post(
            id: UUID().uuidString,
            videoUrl: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"
        ),
        activePostId: .constant(nil)
    )
}



