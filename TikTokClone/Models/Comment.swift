//
//  Comment.swift
//  TikTokClone
//
//  Created by giorgi gotsadze on 1/8/26.
//

import Foundation

struct Comment: Identifiable {
    let id = UUID()
    let username: String
    let text: String
}
