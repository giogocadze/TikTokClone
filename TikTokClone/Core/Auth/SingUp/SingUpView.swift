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

    // MARK: - Validation
    private var passwordsMatch: Bool {
        !password.isEmpty &&
        password == confirmPassword
    }

    private var isFormValid: Bool {
        !email.isEmpty &&
        password.count >= 6 &&
        passwordsMatch
    }

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

                PasswordFieldView(
                    title: "Password",
                    text: $password
                )

                PasswordFieldView(
                    title: "Confirm Password",
                    text: $confirmPassword
                )

        
                if !passwordsMatch && !confirmPassword.isEmpty {
                    Text("Passwords do not match")
                        .font(.caption)
                        .foregroundColor(.red)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }

                if password.count > 0 && password.count < 6 {
                    Text("Password must be at least 6 characters")
                        .font(.caption)
                        .foregroundColor(.red)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }

        
            LoadingButton(
                title: "Sign Up",
                isLoading: auth.isLoading
            ) {
                auth.signIn() // placeholder
            }
            .disabled(!isFormValid)
            .opacity(isFormValid ? 1 : 0.6)

            Spacer()
        }
        .padding()
        .navigationTitle("Sign Up")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    SignUpView()
        .environmentObject(AuthManager())
}


