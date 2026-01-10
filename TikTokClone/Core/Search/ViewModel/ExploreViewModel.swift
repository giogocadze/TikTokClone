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

        let alexId = "alex"
        let mariaId = "maria"
        let johnId = "john"
        let lisaId = "lisa"

        users = [
            User(
                id: alexId,
                username: "alex",
                fullName: "Alex Johnson",
                isFollowing: followed.contains(alexId)
            ),
            User(
                id: mariaId,
                username: "maria",
                fullName: "Maria Gomez",
                isFollowing: followed.contains(mariaId)
            ),
            User(
                id: johnId,
                username: "john",
                fullName: "John Smith",
                isFollowing: followed.contains(johnId)
            ),
            User(
                id: lisaId,
                username: "lisa",
                fullName: "Lisa Brown",
                isFollowing: followed.contains(lisaId)
            )
        ]
    }


    func toggleFollow(for userId: String) {
        guard let index = users.firstIndex(where: { $0.id == userId }) else { return }

        users[index].isFollowing.toggle()

        if users[index].isFollowing {
            auth.follow(userId: userId)
        } else {
            auth.unfollow(userId: userId)
        }

    }

}


