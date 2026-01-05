//
//  NotificationsVIew.swift
//  TikTokClone
//
//  Created by giorgi gotsadze on 1/5/26.
//

import SwiftUI

struct NotificationsVIew: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach (0 ..< 10 ){ notification in
                        NotificationCell()
                            .padding(.top)
                    }
                }
            }
            .navigationTitle("Notifactions")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    NotificationsVIew()
}
