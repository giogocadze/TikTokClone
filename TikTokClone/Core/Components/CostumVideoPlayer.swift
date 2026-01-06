//
//  CostumVideoPlayer.swift
//  TikTokClone
//
//  Created by giorgi gotsadze on 1/6/26.
//

import SwiftUI
import AVKit

struct CustomVideoPlayer: UIViewControllerRepresentable {
    let player: AVPlayer

    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let vc = AVPlayerViewController()
        vc.player = player
        vc.showsPlaybackControls = false
        vc.videoGravity = .resizeAspectFill
        return vc
    }

    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        // keep player attached (important when SwiftUI re-renders)
        if uiViewController.player !== player {
            uiViewController.player = player
        }
    }
}


