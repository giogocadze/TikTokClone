//
//  CurrentUserProfile.swift
//  TikTokClone
//
//  Created by giorgi gotsadze on 1/5/26.
//

import SwiftUI

struct CurrentUserProfile: View {
    @EnvironmentObject var auth: AuthManager
    @State private var showSignOutAlert = false

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ProfileHeaderView()
                    PostGridView()
                }
                .padding(.top)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Sign Out") {
                        showSignOutAlert = true
                    }
                    .font(.subheadline)
                    .foregroundStyle(.black)
                }
            }
            .alert("Sign Out", isPresented: $showSignOutAlert) {
                Button("Cancel", role: .cancel) {}

                Button("Sign Out", role: .destructive) {
                    auth.signOut()
                }
            } message: {
                Text("Are you sure you want to sign out?")
            }

        }
    }
}

#Preview {
    CurrentUserProfile()
        .environmentObject(AuthManager())
}

