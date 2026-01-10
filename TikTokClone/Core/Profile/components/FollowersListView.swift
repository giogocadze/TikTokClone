//
//  FollowersListView.swift
//  TikTokClone
//
//  Created by giorgi gotsadze on 1/10/26.
//

import SwiftUI

struct FollowersListView: View {
    @EnvironmentObject var auth: AuthManager

    var body: some View {
        NavigationStack {
            List {
                ForEach(Array(auth.followerUserIds), id: \.self) { userId in
                    HStack(spacing: 12) {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 44, height: 44)
                            .foregroundStyle(Color(.systemGray5))

                        VStack(alignment: .leading) {
                            Text(userId)
                                .font(.subheadline)
                                .fontWeight(.semibold)

                            Text("@\(userId)")
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }

                        Spacer()
                    }
                }
            }
            .navigationTitle("Followers")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
