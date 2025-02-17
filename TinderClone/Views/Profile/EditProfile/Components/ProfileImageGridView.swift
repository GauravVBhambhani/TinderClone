//
//  ProfileImageGridView.swift
//  TinderClone
//
//  Created by Gaurav Bhambhani on 2/17/25.
//

import SwiftUI

struct ProfileImageGridView: View {

    let user: User

    private let columns: [GridItem] = [
        .init(.flexible()),
        .init(.flexible()),
        .init(.flexible())
    ]

    var body: some View {
        LazyVGrid(columns: columns, spacing: 16) {
            ForEach(0..<6) { index in
                if index < user.profileImageURLs.count { // add image else add blank rectangle
                    Image(user.profileImageURLs[index])
                        .resizable()
                        .scaledToFill()
                        .frame(width: 110, height: 160)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                } else {
                    ZStack (alignment: .bottomTrailing) {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(.secondarySystemBackground))
                            .frame(width: 110, height: 160)

                        Image(systemName: "plus.circle.fill")
                            .imageScale(.large)
                            .foregroundStyle(.red)
                            .offset(x: 8, y: 5)
                    }
                }
            }
        }
    }
}

#Preview {
    ProfileImageGridView(user: MockData.users[0])
}
