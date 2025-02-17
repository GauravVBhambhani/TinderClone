//
//  MatchView.swift
//  TinderClone
//
//  Created by Gaurav Bhambhani on 2/17/25.
//

import SwiftUI

struct MatchView: View {

    @Binding var show: Bool

    @EnvironmentObject var matchViewModel: MatchViewModel

    var body: some View {
        ZStack {
            Rectangle()
                .fill(.black.opacity(0.7))
                .ignoresSafeArea()

            VStack (spacing: 120) {
                VStack {
                    Text("It's a Match!")
                        .font(.largeTitle)
                        .foregroundStyle(.white)

                    if let matchedUser = matchViewModel.matchedUser {
                        Text("You and \(matchedUser.fullname) have liked each other.")
                            .font(.title3)
                            .foregroundStyle(.white)
                    }
                }

                HStack (spacing: 16) {
                    Image(MockData.users[0].profileImageURLs[0])
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                        .overlay {
                            Circle()
                                .stroke(.white, lineWidth: 2)
                                .shadow(radius: 10)
                        }
                    
                    if let matchedUser = matchViewModel.matchedUser {
                        Image(matchedUser.profileImageURLs[0])
                            .resizable()
                            .scaledToFill()
                            .frame(width: 150, height: 150)
                            .clipShape(Circle())
                            .overlay {
                                Circle()
                                    .stroke(.white, lineWidth: 2)
                                    .shadow(radius: 10)
                            }
                    }
                }

                VStack (spacing: 24) {
                    Button ("Send Message") {
                        show.toggle()
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 350, height: 44)
                    .background(.red)
                    .clipShape(Capsule())

                    Button ("Keep Swiping") {
                        show.toggle()
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 350, height: 44)
//                    .background(.red)
                    .clipShape(Capsule())
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.white, lineWidth: 2)
                    }

                }
            }
        }
    }
}

#Preview {
    MatchView(show: .constant(true))
        .environmentObject(MatchViewModel())
}
