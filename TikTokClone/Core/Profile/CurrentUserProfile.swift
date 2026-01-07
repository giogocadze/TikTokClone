//
//  CurrentUserProfile.swift
//  TikTokClone
//
//  Created by giorgi gotsadze on 1/5/26.
//

import SwiftUI

struct CurrentUserProfile: View {
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
                        
                    }
                    .font(.subheadline)
                    .foregroundStyle(.black)
                }
            }
        }
    }
}

#Preview {
    CurrentUserProfile()
}
