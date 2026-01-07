//
//  MainTabVIew.swift
//  TikTokClone
//
//  Created by giorgi gotsadze on 1/5/26.
//

import SwiftUI

import SwiftUI

struct MainTabVIew: View {
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {

            // HOME
            FeedView(isActive: selectedTab == 0)
                .tabItem {
                    VStack {
                        Image(systemName: "house")
                            .environment(
                                \.symbolVariants,
                                selectedTab == 0 ? .fill : .none
                            )
                        Text("Home")
                    }
                }
                .tag(0)

            // FRIENDS
            ExploreView()
                .tabItem {
                    VStack {
                        Image(systemName: "person.2")
                            .environment(
                                \.symbolVariants,
                                selectedTab == 1 ? .fill : .none
                            )
                        Text("Friends")
                    }
                }
                .tag(1)

            // UPLOAD
            Text("UploadPost")
                .tabItem {
                    Image(systemName: "plus")
                }
                .tag(2)

            // INBOX
            NotificationsVIew()
                .tabItem {
                    VStack {
                        Image(systemName: "heart")
                            .environment(
                                \.symbolVariants,
                                selectedTab == 3 ? .fill : .none
                            )
                        Text("Inbox")
                    }
                }
                .tag(3)

            // PROFILE
            CurrentUserProfile()
                .tabItem {
                    VStack {
                        Image(systemName: "person")
                            .environment(
                                \.symbolVariants,
                                selectedTab == 4 ? .fill : .none
                            )
                        Text("Profile")
                    }
                }
                .tag(4)
        }
        .tint(.black)
    }
}

#Preview {
    MainTabVIew()
}
