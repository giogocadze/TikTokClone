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

    // MARK: - Email validation
    private var isEmailValid: Bool {
        let emailRegex = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
        return NSPredicate(format: "SELF MATCHES %@", emailRegex)
            .evaluate(with: email)
    }

    private var isFormValid: Bool {
        isEmailValid && !password.isEmpty
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
                        .onChange(of: email) {
                            auth.errorMessage = nil
                        }

                    PasswordFieldView(
                        title: "Password",
                        text: $password
                    )
                    .onChange(of: password) {
                        auth.errorMessage = nil
                    }

                    if let error = auth.errorMessage {
                        Text(error)
                            .font(.caption)
                            .foregroundColor(.red)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }

                LoadingButton(
                    title: "Log In",
                    isLoading: auth.isLoading
                ) {
                    auth.signIn(email: email)
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

