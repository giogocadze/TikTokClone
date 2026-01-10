//
//  User.swift
//  TikTokClone
//
//  Created by giorgi gotsadze on 1/10/26.
//

import Foundation

struct User: Identifiable {
    let id: String
    let username: String
    let fullName: String
    var isFollowing: Bool
}
