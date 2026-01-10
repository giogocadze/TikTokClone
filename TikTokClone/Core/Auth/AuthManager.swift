//
//  AuthManager.swift
//  TikTokClone
//
//  Created by giorgi gotsadze on 1/7/26.
//

import SwiftUI
import Combine

final class AuthManager: ObservableObject {

    @AppStorage("isLoggedIn") var isLoggedIn = false
    @AppStorage("userEmail") var userEmail: String?

    // 👇 USER PROFILE
    @AppStorage("username") var username: String?
    @AppStorage("bio") var bio: String?
    @AppStorage("profileImageData") var profileImageData: Data?

    @Published var isLoading = false
    @Published var errorMessage: String?
    
    @AppStorage("followingCount") var followingCount: Int = 0
    @AppStorage("followersCount") var followersCount: Int = 0
    @AppStorage("likesCount") var likesCount: Int = 0
    
    @AppStorage("followedUserIds")
    private var followedUserIdsData: Data = Data()

    var followedUserIds: Set<String> {
        get {
            (try? JSONDecoder().decode(Set<String>.self, from: followedUserIdsData)) ?? []
        }
        set {
            followedUserIdsData = (try? JSONEncoder().encode(newValue)) ?? Data()
            followingCount = newValue.count
        }
    }
    
    func follow(userId: String) {
        var set = followedUserIds
        set.insert(userId)
        followedUserIds = set
    }

    func unfollow(userId: String) {
        var set = followedUserIds
        set.remove(userId)
        followedUserIds = set
    }


    private var registeredEmails: Set<String> = []

    func signIn(email: String) {
        guard !isLoading else { return }

        isLoading = true
        errorMessage = nil

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.isLoading = false

            if self.registeredEmails.contains(email) {
                self.followingCount = 0
                self.followersCount = 0
                self.likesCount = 0
                self.userEmail = email
                self.username = email.components(separatedBy: "@").first
                self.bio = "No bio yet"
                self.isLoggedIn = true
            } else {
                self.errorMessage = "Invalid email or password"
            }
        }
    }

    func signUp(email: String) {
        guard !isLoading else { return }

        isLoading = true
        errorMessage = nil

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
            self.isLoading = false

            if self.registeredEmails.contains(email) {
                self.errorMessage = "Email already in use"
            } else {
                self.registeredEmails.insert(email)
                self.followingCount = 0
                self.followersCount = 0
                self.likesCount = 0
                self.userEmail = email
                self.username = email.components(separatedBy: "@").first
                self.bio = "Welcome to TikTokClone 👋"
                self.isLoggedIn = true
            }
        }
    }
    

    func signOut() {
        isLoggedIn = false
        userEmail = nil
        username = nil
        bio = nil
        profileImageData = nil
        followingCount = 0
        followersCount = 0
        likesCount = 0
        followedUserIds = []

    }

}



