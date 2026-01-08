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

    @State private var isPlaying = true
    @Binding var activePostId: String?

    @State private var player: AVPlayer

    @State private var isLiked = false
    @State private var likeCount = 26
    @State private var showHeartAnimation = false

    init(post: Post, activePostId: Binding<String?>) {
        self.post = post
        self._activePostId = activePostId
        _player = State(initialValue: AVPlayer(url: URL(string: post.videoUrl)!))
    }

    var body: some View {
        ZStack {

            // Video
            CustomVideoPlayer(player: player)
                .containerRelativeFrame([.horizontal, .vertical])
                .allowsHitTesting(false)

            // Gesture layer
            Color.clear
                .contentShape(Rectangle())
                .onTapGesture(count: 2) {
                    likePost()
                }
                .onTapGesture {
                    togglePlayback()
                }

            if !isPlaying {
                Image(systemName: "play.fill")
                    .font(.system(size: 60))
                    .foregroundColor(.white)
            }

            if showHeartAnimation {
                Image(systemName: "heart.fill")
                    .font(.system(size: 100))
                    .foregroundColor(.red)
                    .scaleEffect(showHeartAnimation ? 1 : 0.5)
                    .opacity(showHeartAnimation ? 1 : 0)
                    .animation(.easeOut(duration: 0.3), value: showHeartAnimation)
            }

            overlay
        }
        .onChange(of: activePostId) { _, newValue in
            if newValue == post.id {
                player.play()
                isPlaying = true
            } else {
                player.pause()
                isPlaying = false
                player.seek(to: .zero)
            }
        }
        .onAppear {
            if activePostId == nil {
                activePostId = post.id
            }
        }
    }

    private var overlay: some View {
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
                Button {
                    toggleLike()
                } label: {
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
                Button {} label: {
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

            iconButton("bookmark.fill")
            iconButton("arrowshape.turn.up.right.fill")
        }
    }

    private func iconButton(_ icon: String) -> some View {
        Button {} label: {
            Image(systemName: icon)
                .resizable()
                .frame(width: 28, height: 25)
                .foregroundColor(.white)
        }
    }

    private func togglePlayback() {
        guard activePostId == post.id else { return }

        if isPlaying {
            player.pause()
        } else {
            player.play()
        }
        isPlaying.toggle()
    }

    private func toggleLike() {
        isLiked.toggle()
        likeCount += isLiked ? 1 : -1
    }

    private func likePost() {
        guard !isLiked else { return }

        isLiked = true
        likeCount += 1

        showHeartAnimation = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            showHeartAnimation = false
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



