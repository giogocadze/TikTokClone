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

    // Playback
    @Published var isPlaying = true
    let player: AVPlayer

    // Likes
    @Published var isLiked = false
    @Published var likeCount = 26
    @Published var showHeartAnimation = false
    @Published var heartPosition: CGPoint = .zero

    init(videoURL: String) {
        self.player = AVPlayer(url: URL(string: videoURL)!)
    }

    func play() {
        player.play()
        isPlaying = true
    }

    func pause() {
        player.pause()
        isPlaying = false
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
