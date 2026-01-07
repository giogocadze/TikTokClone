//
//  AuthManager.swift
//  TikTokClone
//
//  Created by giorgi gotsadze on 1/7/26.
//

import SwiftUI
import Combine

final class AuthManager: ObservableObject {
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    @Published var isLoading = false

    func signIn() {
        guard !isLoading else { return }

        isLoading = true

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.isLoading = false
            self.isLoggedIn = true
        }
    }

    func signOut() {
        isLoggedIn = false
    }
}
