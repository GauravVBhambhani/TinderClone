//
//  EditProfileView.swift
//  TinderClone
//
//  Created by Gaurav Bhambhani on 2/17/25.
//

import SwiftUI

struct EditProfileView: View {

    @Environment(\.dismiss) var dismiss
    let user: User

    @State private var bio = ""
    @State private var occupation = "iOS Developer"

    var body: some View {
        NavigationStack {
            ScrollView (showsIndicators: false) {

                ProfileImageGridView(user: user)
                    .padding()

                VStack (spacing: 24) {
                    VStack (alignment: .leading) {
                        Text("About me")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .padding(.leading)

                        TextField("Add your bio", text: $bio, axis: .vertical)
                            .padding()
                            .frame(height: 84, alignment: .top)
                            .background(Color(.secondarySystemBackground))
                            .font(.subheadline)
                    }

                    VStack (alignment: .leading) {
                        Text("OCCUPATION")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .padding(.leading)

                        HStack {
                            Image(systemName: "book")
                            Text("Occupation")

                            Spacer()

                            Text(occupation)
                                .font(.footnote)
                        }
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .font(.subheadline)
                    }

                    VStack (alignment: .leading) {
                        Text("GENDER")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .padding(.leading)

                        HStack {
                            Text("Man")
                            Spacer()
                            Image(systemName: "chevron.right")
                                .imageScale(.small)
                        }
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .font(.subheadline)
                    }

                    VStack (alignment: .leading) {
                        Text("SEXUAL ORIENTATION")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .padding(.leading)

                        HStack {
                            Text("Straight")
                            Spacer()
                            Image(systemName: "chevron.right")
                                .imageScale(.small)
                        }
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .font(.subheadline)
                    }
                }



            }
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem (placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .foregroundStyle(.red)
                }

                ToolbarItem (placement: .topBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                    .fontWeight(.semibold)
                }
            }
        }
    }
}

#Preview {
    EditProfileView(user: MockData.users[0])
}
