//
//  LoginView.swift
//  TikTokClone
//
//  Created by giorgi gotsadze on 1/7/26.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var auth: AuthManager

    @State private var email = ""
    @State private var password = ""

    private var isFormValid: Bool {
        !email.isEmpty && !password.isEmpty
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                Spacer()

                Text("TikTok")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                VStack(spacing: 16) {
                    TextField("Email", text: $email)
                        .textInputAutocapitalization(.never)
                        .keyboardType(.emailAddress)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)

                    PasswordFieldView(
                        title: "Password",
                        text: $password
                    )
                }

                LoadingButton(
                    title: "Log In",
                    isLoading: auth.isLoading
                ) {
                    auth.signIn()
                }
                .disabled(!isFormValid)
                .opacity(isFormValid ? 1 : 0.6)

                HStack(spacing: 4) {
                    Text("Don't have an account?")
                        .foregroundStyle(.gray)

                    NavigationLink {
                        SignUpView()
                    } label: {
                        Text("Sign up")
                            .fontWeight(.semibold)
                    }
                }
                .font(.subheadline)

                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    LoginView()
        .environmentObject(AuthManager())
}
