//
//  UserCell.swift
//  TikTokClone
//
//  Created by giorgi gotsadze on 1/5/26.
//

import SwiftUI

struct UserCell: View {
    let user: User
    let onFollowTap: () -> Void

    var body: some View {
        HStack(spacing: 12) {

            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 48, height: 48)
                .foregroundStyle(Color(.systemGray5))

            VStack(alignment: .leading) {
                Text(user.username)
                    .font(.subheadline)
                    .fontWeight(.semibold)

                Text(user.fullName)
                    .font(.footnote)
                    .foregroundColor(.gray)
            }

            Spacer()

            Button(action: onFollowTap) {
                Text(user.isFollowing ? "Following" : "Follow")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 100, height: 32)
                    .background(user.isFollowing ? Color(.systemGray5) : .black)
                    .foregroundColor(user.isFollowing ? .black : .white)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
            }
        }
        .padding(.horizontal)
    }
}


#Preview {
    UserCell(
        user: User(
            id: UUID().uuidString,
            username: "giorgi",
            fullName: "Giorgi Gotsadze",
            isFollowing: false
        ),
        onFollowTap: {}
    )
}

