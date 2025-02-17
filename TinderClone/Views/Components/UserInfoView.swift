//
//  UserInfoView.swift
//  TinderClone
//
//  Created by Gaurav Bhambhani on 2/15/25.
//

import SwiftUI

struct UserInfoView: View {

    let user: User
    @Binding var showProfileModal: Bool

    var body: some View {
        VStack(alignment: .leading){
            HStack {
                Text(user.fullname)
                    .font(.title)
                    .fontWeight(.heavy)

                Text("\(user.age)")
                    .font(.title)
                    .fontWeight(.semibold)

                Spacer()

                Button {
                    showProfileModal.toggle()

                } label: {
                    Image(systemName: "arrow.up.circle")
                        .fontWeight(.bold)
                        .imageScale(.large)
                }
            }

            Text("Student | iOS Developer")
                .font(.subheadline)
                .lineLimit(2)

        }
        .foregroundStyle(.white)
        .padding()
        .background(
            LinearGradient(colors: [.clear, .black], startPoint: .top, endPoint: .bottom)
        )
    }
}

#Preview {
    UserInfoView(user: MockData.users[0], showProfileModal: .constant(false))
}
