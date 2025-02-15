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
                Text("Swiping view")
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
                Text("Profile view")
                    .tag(3)
            } label: {
                Image(systemName: "person")
            }

        }
        .tint(.primary)
    }
}

#Preview {
    MainTabView()
}
