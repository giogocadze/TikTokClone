//
//   ExploreViewModel.swift
//  TikTokClone
//
//  Created by giorgi gotsadze on 1/10/26.
//

import SwiftUI
import Combine
final class ExploreViewModel: ObservableObject {
    @Published var users: [User] = []

    init() {
        fetchUsers()
    }

    func fetchUsers() {
        users = [
            User(id: UUID().uuidString, username: "alex", fullName: "Alex Johnson", isFollowing: false),
            User(id: UUID().uuidString, username: "maria", fullName: "Maria Gomez", isFollowing: true),
            User(id: UUID().uuidString, username: "john", fullName: "John Smith", isFollowing: false),
            User(id: UUID().uuidString, username: "lisa", fullName: "Lisa Brown", isFollowing: false),
        ]
    }

    func toggleFollow(for userId: String) {
        guard let index = users.firstIndex(where: { $0.id == userId }) else { return }
        users[index].isFollowing.toggle()
    }
}
