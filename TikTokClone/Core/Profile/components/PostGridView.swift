//
//  PostGridView.swift
//  TikTokClone
//
//  Created by giorgi gotsadze on 1/5/26.
//

import SwiftUI

struct PostGridView: View {

    private let columns = Array(
        repeating: GridItem(.flexible(), spacing: 1),
        count: 3
    )

    var body: some View {
        LazyVGrid(columns: columns, spacing: 1) {
            ForEach(0..<25, id: \.self) { _ in
                Rectangle()
                Rectangle()
                    .frame(height: 160)
                    .frame(maxWidth: .infinity)

            }
        }
    }
}


#Preview {
    PostGridView()
}
