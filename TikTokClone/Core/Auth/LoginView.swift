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
    @State private var isPasswordVisible = false

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

                    HStack {
                        Group {
                            if isPasswordVisible {
                                TextField("Password", text: $password)
                            } else {
                                SecureField("Password", text: $password)
                            }
                        }
                        .textInputAutocapitalization(.never)

                        Button {
                            isPasswordVisible.toggle()
                        } label: {
                            Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                                .foregroundStyle(.gray)
                        }
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                }

                Button {
                    auth.signIn()
                } label: {
                    Text("Log In")
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(.red)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }

                // 👇 Sign up text
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
}
