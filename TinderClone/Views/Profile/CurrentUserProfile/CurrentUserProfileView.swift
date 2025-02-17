//
//  CurrentUserProfileView.swift
//  TinderClone
//
//  Created by Gaurav Bhambhani on 2/17/25.
//

import SwiftUI

struct CurrentUserProfileView: View {

    let user: User

    @State private var showEditProfileView: Bool = false

    var body: some View {
        NavigationStack {
            List {
                // header
                CurrentUserProfileHeaderView(user: user)
                    .onTapGesture {
                        showEditProfileView.toggle()
                    }

                // account info
                Section("Account Information") {
                    HStack {
                        Text("Name")
                        Spacer()
                        Text(user.fullname)
                    }

                    HStack {
                        Text("Email")
                        Spacer()
                        Text("bhambhani.g@outlook.com")
                    }
                }

                // legal

                Section("Legal") {
                    Text("Terms of Service")
                }

                // logout / delete
                Section {
                    HStack {
                        Image(systemName: "rectangle.portrait.and.arrow.forward")
                        Button("Logout") {
                            print("Logging out...")
                        }
                    }
                    .foregroundStyle(.red)
                }

                Section {
                    HStack {
                        Image(systemName: "trash.fill")
                        Button("Delete Account") {
                            print("Deleting account...")
                        }
                    }
                    .foregroundStyle(.red)
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .fullScreenCover(isPresented: $showEditProfileView) {
                EditProfileView(user: user)
            }
        }
    }
}

#Preview {
    CurrentUserProfileView(user: MockData.users[0])
}
