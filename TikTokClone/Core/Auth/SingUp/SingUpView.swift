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
    
    
    private var isEmailValid: Bool {
        let emailRegex = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
        return NSPredicate(format: "SELF MATCHES %@", emailRegex)
            .evaluate(with: email)
    }


    private var passwordsMatch: Bool {
        !password.isEmpty &&
        password == confirmPassword
    }

    private var isFormValid: Bool {
        isEmailValid &&
        password.count >= 6 &&
        password == confirmPassword
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

                if !email.isEmpty && !isEmailValid {
                    Text("Please enter a valid email address")
                        .font(.caption)
                        .foregroundColor(.red)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }

                
                
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
                auth.signUp() 
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


