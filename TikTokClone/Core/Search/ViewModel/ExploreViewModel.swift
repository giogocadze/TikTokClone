//
//   ExploreViewModel.swift
//  TikTokClone
//
//  Created by giorgi gotsadze on 1/10/26.
//
import Combine
import Foundation
final class ExploreViewModel: ObservableObject {
    @Published var users: [User] = []

    private let auth: AuthManager

    init(auth: AuthManager) {
        self.auth = auth
        fetchUsers()
    }

    private func fetchUsers() {
        let followed = auth.followedUserIds

        users = [
            User(id: UUID().uuidString, username: "alex", fullName: "Alex Johnson", isFollowing: followed.contains("alex")),
            User(id: UUID().uuidString, username: "maria", fullName: "Maria Gomez", isFollowing: followed.contains("maria")),
            User(id: UUID().uuidString, username: "john", fullName: "John Smith", isFollowing: followed.contains("john")),
            User(id: UUID().uuidString, username: "lisa", fullName: "Lisa Brown", isFollowing: followed.contains("lisa")),
        ]
    }

    func toggleFollow(for userId: String) {
        guard let index = users.firstIndex(where: { $0.id == userId }) else { return }

        users[index].isFollowing.toggle()

        if users[index].isFollowing {
            auth.follow(userId: userId)

            auth.gainFollower(userId: userId)
        } else {
            auth.unfollow(userId: userId)

     
            auth.loseFollower(userId: userId)
        }
    }

}


