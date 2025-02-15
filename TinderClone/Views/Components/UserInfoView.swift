//
//  UserInfoView.swift
//  TinderClone
//
//  Created by Gaurav Bhambhani on 2/15/25.
//

import SwiftUI

struct UserInfoView: View {
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                Text("Gaurav")
                    .font(.title)
                    .fontWeight(.heavy)

                Text("23")
                    .font(.title)
                    .fontWeight(.semibold)

                Spacer()

                Button {
                    print("DEBUG: Show profile here..")

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
    UserInfoView()
}
