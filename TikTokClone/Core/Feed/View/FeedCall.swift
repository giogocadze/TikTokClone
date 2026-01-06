//
//  FeedCall.swift
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

    init(post: Post, activePostId: Binding<String?>) {
        self.post = post
        self._activePostId = activePostId
        _player = State(initialValue: AVPlayer(url: URL(string: post.videoUrl)!))
    }

    var body: some View {
        ZStack {
            // Video (disable hit testing so it doesn't swallow taps)
            CustomVideoPlayer(player: player)
                .containerRelativeFrame([.horizontal, .vertical])
                .allowsHitTesting(false)

            // ✅ Tap layer ABOVE video, BELOW overlay buttons
            Color.clear
                .contentShape(Rectangle())
                .onTapGesture {
                    togglePlayback()
                }

            if !isPlaying {
                Image(systemName: "play.fill")
                    .font(.system(size: 60))
                    .foregroundColor(.white)
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
            // autoplay first video
            if activePostId == nil {
                activePostId = post.id
            }
        }
    }

    // MARK: - Overlay UI (UNCHANGED)
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

            actionButton(icon: "heart.fill", count: "26")
            actionButton(icon: "ellipsis.bubble.fill", count: "27")

            iconButton("bookmark.fill")
            iconButton("arrowshape.turn.up.right.fill")
        }
    }

    private func actionButton(icon: String, count: String) -> some View {
        VStack {
            Button {} label: {
                Image(systemName: icon)
                    .resizable()
                    .frame(width: 28, height: 25)
                    .foregroundColor(.white)
            }
            Text(count)
                .font(.caption)
                .foregroundStyle(.white)
                .bold()
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
        // Optional safety: only allow tap control on the active cell
        guard activePostId == post.id else { return }

        if isPlaying {
            player.pause()
        } else {
            player.play()
        }
        isPlaying.toggle()
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

