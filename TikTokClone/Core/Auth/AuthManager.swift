//
//  AuthManager.swift
//  TikTokClone
//
//  Created by giorgi gotsadze on 1/7/26.
//

import SwiftUI
import Combine
final class AuthManager: ObservableObject {
    @Published var isLoggedIn: Bool = false

    func signIn() {
        isLoggedIn = true
    }

    func signOut() {
        isLoggedIn = false
    }
}
