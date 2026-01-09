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

    @Published var isLoading = false
    @Published var errorMessage: String?

    private var registeredEmails: Set<String> = []

    func signIn(email: String) {
        guard !isLoading else { return }

        errorMessage = nil
        isLoading = true

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.isLoading = false

            if self.registeredEmails.contains(email) {
                self.userEmail = email
                self.isLoggedIn = true
            } else {
                self.errorMessage = "Invalid email or password"
            }
        }
    }

    func signUp(email: String) {
        guard !isLoading else { return }

        errorMessage = nil
        isLoading = true

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
            self.isLoading = false

            if self.registeredEmails.contains(email) {
                self.errorMessage = "Email already in use"
            } else {
                self.registeredEmails.insert(email)
                self.userEmail = email
                self.isLoggedIn = true
            }
        }
    }

    func signOut() {
        isLoggedIn = false
        userEmail = nil
    }
}


