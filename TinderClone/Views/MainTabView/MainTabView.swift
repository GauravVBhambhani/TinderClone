//
//  MainTabView.swift
//  TinderClone
//
//  Created by Gaurav Bhambhani on 2/14/25.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            Tab {
                CardStackView()
                    .tag(0)
            } label: {
                Image(systemName: "flame")
            }

            Tab {
                Text("Search View")
                    .tag(1)
            } label: {
                Image(systemName: "magnifyingglass")
            }

            Tab {
                Text("Chat view")
                    .tag(2)
            } label: {
                Image(systemName: "bubble")
            }

            Tab {
                CurrentUserProfileView(user: MockData.users[0])
                    .tag(3)
            } label: {
                Image(systemName: "person")
            }

        }
//        .tint(.red)
    }
}

#Preview {
    MainTabView()
        .environmentObject(MatchViewModel())
}
