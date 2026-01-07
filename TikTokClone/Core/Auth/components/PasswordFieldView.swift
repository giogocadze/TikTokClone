//
//  PasswordFieldView.swift
//  TikTokClone
//
//  Created by giorgi gotsadze on 1/7/26.
//

import SwiftUI

struct PasswordFieldView: View {
    let title: String
    @Binding var text: String

    @State private var isVisible = false

    var body: some View {
        HStack {
            Group {
                if isVisible {
                    TextField(title, text: $text)
                } else {
                    SecureField(title, text: $text)
                }
            }
            .textInputAutocapitalization(.never)
            .textContentType(.newPassword)

            Button {
                isVisible.toggle()
            } label: {
                Image(systemName: isVisible ? "eye" : "eye.slash")
                    .foregroundStyle(.gray)
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(8)
    }
}
