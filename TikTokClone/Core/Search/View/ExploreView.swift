//
//  ExploreView.swift
//  TikTokClone
//
//  Created by giorgi gotsadze on 1/5/26.
//


import SwiftUI
import Combine

struct ExploreView: View {
    @StateObject private var vm: ExploreViewModel

    init(auth: AuthManager) {
        _vm = StateObject(
            wrappedValue: ExploreViewModel(auth: auth)
        )
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 20) {
                    ForEach(vm.users) { user in
                        UserCell(
                            user: user,
                            onFollowTap: {
                                vm.toggleFollow(for: user.id)
                            }
                        )
                    }
                }
                .padding(.top)
            }
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}





#Preview {
    let auth = AuthManager()

    ExploreView(auth: auth)
        .environmentObject(auth)
}
