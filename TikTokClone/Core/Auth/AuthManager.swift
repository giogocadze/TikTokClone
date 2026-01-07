//
//  AuthManager.swift
//  TikTokClone
//
//  Created by giorgi gotsadze on 1/7/26.
//

import SwiftUI
import Combine

final class AuthManager: ObservableObject {

    @Published var isLoggedIn = false
    @Published var isLoading = false
    @Published var errorMessage: String?


    func signIn() {
        guard !isLoading else { return }

        errorMessage = nil
        isLoading = true

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
            self.isLoading = false
            self.isLoggedIn = true
        }
    }

 
    func signUp() {
        guard !isLoading else { return }

        errorMessage = nil
        isLoading = true

        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.isLoading = false
            self.isLoggedIn = true
        }
    }

    func signOut() {
        isLoggedIn = false
    }
}

