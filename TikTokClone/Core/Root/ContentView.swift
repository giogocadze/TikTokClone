//
//  ContentView.swift
//  TikTokClone
//
//  Created by giorgi gotsadze on 1/5/26.
//

import SwiftUI

struct RootView: View {
    @StateObject private var auth = AuthManager()

    var body: some View {
        Group {
            if auth.isLoggedIn {
                MainTabVIew()
            } else {
                LoginView()
            }
        }
        .environmentObject(auth)
    }
}
#Preview { 
    RootView()
}
