//
//  CommentsView.swift
//  TikTokClone
//
//  Created by giorgi gotsadze on 1/8/26.
//

import SwiftUI

struct CommentsView: View {
    @ObservedObject var vm: FeedCellViewModel
    @State private var commentText = ""

    var body: some View {
        VStack {
            Capsule()
                .frame(width: 40, height: 5)
                .foregroundColor(.gray)
                .padding(.top, 8)

            Text("Comments")
                .font(.headline)
                .padding()

            ScrollView {
                VStack(spacing: 16) {
                    ForEach(vm.comments) { comment in
                        HStack(alignment: .top) {
                            Circle()
                                .frame(width: 32, height: 32)
                                .foregroundColor(.gray)

                            VStack(alignment: .leading) {
                                Text(comment.username)
                                    .font(.subheadline)
                                    .bold()
                                Text(comment.text)
                                    .font(.subheadline)
                            }

                            Spacer()
                        }
                    }
                }
                .padding()
            }

            Divider()

            HStack {
                TextField("Add comment...", text: $commentText)
                    .textFieldStyle(.roundedBorder)

                Button("Post") {
                    vm.addComment(commentText)
                    commentText = ""
                }
                .disabled(commentText.isEmpty)
            }
            .padding()
        }
        .presentationDetents([.medium, .large])
    }
}
