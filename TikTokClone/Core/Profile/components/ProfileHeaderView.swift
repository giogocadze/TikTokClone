//
//  ProfileHeaderView.swift
//  TikTokClone
//
//  Created by giorgi gotsadze on 1/5/26.
//

import SwiftUI

struct ProfileHeaderView: View {
    @EnvironmentObject var auth: AuthManager

    var body: some View {
        VStack(spacing: 16) {

            VStack(spacing: 8) {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .foregroundStyle(Color(.systemGray5))

                Text(displayName)
                    .font(.subheadline)
                    .fontWeight(.semibold)
            }

            HStack(spacing: 16) {
                UserStatView(value: 5, title: "Following")
                UserStatView(value: 1, title: "Followers")
                UserStatView(value: 10, title: "Likes")
            }

            Button {
                // edit profile
            } label: {
                Text("Edit Profile")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 32)
                    .foregroundStyle(.black)
                    .background(Color(.systemGray5))
                    .clipShape(RoundedRectangle(cornerRadius: 6))
            }

            Divider()
        }
    }

    // MARK: - Derived username
    private var displayName: String {
        guard let email = auth.userEmail else { return "User" }
        return email.components(separatedBy: "@").first ?? email
    }
}



#Preview {
    let auth = AuthManager()
    auth.userEmail = "giorgi@gmail.com"

    return ProfileHeaderView()
        .environmentObject(auth)
}
