//
//  FeedVIewModel.swift
//  TikTokClone
//
//  Created by giorgi gotsadze on 1/6/26.
//

import Foundation
import Combine

class FeedViewModel : ObservableObject {
    @Published var posts = [Post]()
    let VideoUrls = [
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
    ]
    init()  {
        FetchPost()
    }
    func FetchPost() {
        self.posts = [
            .init(id: NSUUID().uuidString, videoUrl: VideoUrls[0]),
            .init(id: NSUUID().uuidString, videoUrl: VideoUrls[1]),
            .init(id: NSUUID().uuidString, videoUrl: VideoUrls[2]),
            .init(id: NSUUID().uuidString, videoUrl: VideoUrls[3]),
            
        ]
        
    }
}
