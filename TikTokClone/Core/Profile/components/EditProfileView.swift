//
//  EditProfileView.swift
//  TikTokClone
//
//  Created by giorgi gotsadze on 1/9/26.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    @EnvironmentObject var auth: AuthManager
    @Environment(\.dismiss) private var dismiss

    @State private var username = ""
    @State private var bio = ""
    @State private var selectedItem: PhotosPickerItem?

    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {

                // PROFILE IMAGE
                PhotosPicker(selection: $selectedItem, matching: .images) {
                    ZStack {
                        if let data = auth.profileImageData,
                           let image = UIImage(data: data) {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFill()
                        } else {
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .foregroundColor(.gray)
                        }
                    }
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                }

                VStack(spacing: 16) {

                    TextField("Username", text: $username)
                        .textInputAutocapitalization(.never)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)

                    TextField("Bio", text: $bio, axis: .vertical)
                        .lineLimit(3, reservesSpace: true)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                }

                Spacer()
            }
            .padding()
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }

                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        saveChanges()
                        dismiss()
                    }
                    .fontWeight(.semibold)
                }
            }
            .onAppear {
                username = auth.username ?? ""
                bio = auth.bio ?? ""
            }
            .onChange(of: selectedItem) {
                loadImage()
            }
        }
    }

    private func saveChanges() {
        auth.username = username
        auth.bio = bio
    }

    private func loadImage() {
        Task {
            if let data = try? await selectedItem?.loadTransferable(type: Data.self) {
                auth.profileImageData = data
            }
        }
    }
}
