//
//  FeedVideoLayer.swift
//  TikTokClone
//
//  Created by giorgi gotsadze on 1/8/26.
//

import SwiftUI
import AVKit
struct FeedVideoLayer: View {
    let player: AVPlayer
    let onDoubleTap: (CGPoint) -> Void
    let onSingleTap: () -> Void

    var body: some View {
        Color.clear
            .contentShape(Rectangle())
            .simultaneousGesture(
                SpatialTapGesture(count: 2)
                    .onEnded { value in
                        onDoubleTap(value.location)
                    }
            )
            .onTapGesture {
                onSingleTap()
            }
    }
}
