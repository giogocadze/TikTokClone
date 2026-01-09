//
//  FeedCellViewModel.swift
//  TikTokClone
//
//  Created by giorgi gotsadze on 1/8/26.
//

import SwiftUI
import AVKit
import Combine
final class FeedCellViewModel: ObservableObject {


    private var currentUsername: String = "user"




    @Published var isPlaying = true
    let player: AVPlayer

   
    @Published var isLiked = false
    @Published var likeCount = 26
    @Published var showHeartAnimation = false
    @Published var heartPosition: CGPoint = .zero

    @Published var comments: [Comment] = [
        Comment(username: "alex", text: "🔥🔥🔥"),
        Comment(username: "maria", text: "This is amazing"),
        Comment(username: "john", text: "How did you edit this?")
    ]

    @Published var isCommentsPresented = false

    var commentCount: Int {
        comments.count
    }


    init(videoURL: String, username: String) {
        self.player = AVPlayer(url: URL(string: videoURL)!)
        self.currentUsername = username
    }
    func addComment(_ text: String) {
        guard !text.isEmpty else { return }

        comments.append(
            Comment(username: currentUsername, text: text)
        )
    }


    func play() {
        player.play()
        isPlaying = true
    }

    func pause() {
        player.pause()
        isPlaying = false
    }

    func updateUsername(_ username: String) {
        self.currentUsername = username
    }

    func togglePlayback(isActive: Bool) {
        guard isActive else { return }
        isPlaying ? pause() : play()
    }


    func toggleLike() {
        isLiked.toggle()
        likeCount += isLiked ? 1 : -1
    }

    func like(at position: CGPoint) {
        guard !isLiked else { return }

        isLiked = true
        likeCount += 1
        heartPosition = position

        showHeartAnimation = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            self.showHeartAnimation = false
        }
    }
}

