//
//  MainTabVIew.swift
//  TikTokClone
//
//  Created by giorgi gotsadze on 1/5/26.
//

import SwiftUI

struct MainTabVIew: View {
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {

            FeedView(isActive: selectedTab == 0)
                .tabItem {
                    VStack {
                        Image(systemName: selectedTab == 0 ? "house.fill" : "house")
                        Text("Home")
                    }
                }
                .tag(0)

            ExploreView()
                .tabItem {
                    VStack {
                        Image(systemName: selectedTab == 1 ? "person.2.fill" : "person.2")
                        Text("Friends")
                    }
                }
                .tag(1)

            Text("UploadPost")
                .tabItem { Image(systemName: "plus") }
                .tag(2)

            NotificationsVIew()
                .tabItem {
                    VStack {
                        Image(systemName: selectedTab == 3 ? "heart.fill" : "heart")
                        Text("Inbox")
                    }
                }
                .tag(3)

            CurrentUserProfile()
                .tabItem {
                    VStack {
                        Image(systemName: selectedTab == 4 ? "person.fill" : "person")
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
