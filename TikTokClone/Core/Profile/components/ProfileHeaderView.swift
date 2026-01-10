//
//  ProfileHeaderView.swift
//  TikTokClone
//
//  Created by giorgi gotsadze on 1/5/26.
//

import SwiftUI

struct ProfileHeaderView: View {
    @EnvironmentObject var auth: AuthManager
    @State private var showEditProfile = false

    var body: some View {
        VStack(spacing: 16) {

            VStack(spacing: 8) {

                Group {
                    if let data = auth.profileImageData,
                       let image = UIImage(data: data) {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                    } else {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .foregroundStyle(Color(.systemGray5))
                    }
                }
                .frame(width: 80, height: 80)
                .clipShape(Circle())

                Text(auth.username ?? displayName)
                    .font(.subheadline)
                    .fontWeight(.semibold)


                if let bio = auth.bio {
                    Text(bio)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }

            HStack(spacing: 16) {

                Button {
                    showFollowing = true
                } label: {
                    UserStatView(value: auth.followingCount, title: "Following")
                }

                Button {
                    showFollowers = true
                } label: {
                    UserStatView(value: auth.followersCount, title: "Followers")
                }

                UserStatView(value: auth.likesCount, title: "Likes")
            }
            .sheet(isPresented: $showFollowers) {
                FollowersListView()
                    .environmentObject(auth)
            }
            .sheet(isPresented: $showFollowing) {
                FollowingListView()
                    .environmentObject(auth)
            }


            Button {
                showEditProfile = true
            } label: {
                Text("Edit Profile")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 32)
                    .foregroundStyle(.black)
                    .background(Color(.systemGray5))
                    .clipShape(RoundedRectangle(cornerRadius: 6))
            }
            .sheet(isPresented: $showEditProfile) {
                EditProfileView()
                    .environmentObject(auth)
            }

            Divider()
        }
    }

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
