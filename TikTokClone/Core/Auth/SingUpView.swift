//
//  SingUpView.swift
//  TikTokClone
//
//  Created by giorgi gotsadze on 1/7/26.
//

import SwiftUI

struct SignUpView: View {
    @EnvironmentObject var auth: AuthManager

    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var isPasswordVisible = false

    var body: some View {
        VStack(spacing: 24) {
            Spacer()

            Text("Create Account")
                .font(.largeTitle)
                .fontWeight(.bold)

            VStack(spacing: 16) {
                TextField("Email", text: $email)
                    .textInputAutocapitalization(.never)
                    .keyboardType(.emailAddress)
                    .textContentType(.emailAddress)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)

                // Password
                passwordField(
                    title: "Password",
                    text: $password
                )

                // Confirm password
                passwordField(
                    title: "Confirm Password",
                    text: $confirmPassword
                )
            }

            Button {
                auth.signIn()
            } label: {
                Text("Sign Up")
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .background(.red)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }

            Spacer()
        }
        .padding()
        .navigationTitle("Sign Up")
        .navigationBarTitleDisplayMode(.inline)
    }

    // MARK: - Reusable password field
    private func passwordField(
        title: String,
        text: Binding<String>
    ) -> some View {
        HStack {
            Group {
                if isPasswordVisible {
                    TextField(title, text: text)
                } else {
                    SecureField(title, text: text)
                }
            }
            .textInputAutocapitalization(.never)
            .textContentType(.newPassword)

            Button {
                isPasswordVisible.toggle()
            } label: {
                Image(systemName: isPasswordVisible ? "eye" : "eye.slash")
                    .foregroundStyle(.gray)
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(8)
    }
}



#Preview {
    SignUpView()
}
