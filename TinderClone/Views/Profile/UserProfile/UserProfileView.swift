//
//  UserProfileView.swift
//  TinderClone
//
//  Created by Gaurav Bhambhani on 2/16/25.
//

import SwiftUI

struct UserProfileView: View {

    @Environment(\.dismiss) var dismiss
    let user: User

    @State private var currentImageIndex = 0

    var body: some View {
        VStack {
            HStack {
                Text(user.fullname)
                    .font(.title2)
                    .fontWeight(.semibold)

                Text("\(user.age)")
                    .font(.title2)

                Spacer()

                Button {
                    dismiss()
                } label: {
                    Image(systemName: "arrow.down.circle.fill")
                        .imageScale(.large)
                        .fontWeight(.bold)
                        .foregroundStyle(.red)
                }
            }
            .padding(.horizontal)

            ScrollView {
                VStack {
                    ZStack (alignment: .top) {
                        Image(user.profileImageURLs[currentImageIndex])
                            .resizable()
                            .scaledToFill()
                            .frame(width: SizeConstants.cardWidth, height: SizeConstants.cardHeight)
                            .overlay {
                                ImageScrollingOverlay(currentImageIndex: $currentImageIndex, numberOfImages: user.profileImageURLs.count)
                            }

                        CardImageIndicatorView(currentImageIndex: currentImageIndex, numberOfImages: user.profileImageURLs.count)
                    }

                    VStack (alignment: .leading) {
                        Text("About me")
                            .fontWeight(.semibold)

                        Text("Some test bio for now...")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .font(.subheadline)

                    VStack (alignment: .leading, spacing: 12) {
                        Text("Essentials")
                            .fontWeight(.semibold)

                        HStack {
                            Image(systemName: "person")
                            Text("Man")

                            Spacer()
                        }

                        HStack {
                            Image(systemName: "arrow.down.forward.and.arrow.up.backward.circle")
                            Text("Straight")

                            Spacer()
                        }

                        HStack {
                            Image(systemName: "book")
                            Text("iOS Developer")

                            Spacer()
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .font(.subheadline)
                }
            }
        }
    }
}

#Preview {
    UserProfileView(user: MockData.users[0])
}
