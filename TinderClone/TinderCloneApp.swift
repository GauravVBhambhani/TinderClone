//
//  TinderCloneApp.swift
//  TinderClone
//
//  Created by Gaurav Bhambhani on 2/14/25.
//

import SwiftUI

@main
struct TinderCloneApp: App {

    @StateObject var matchViewModel = MatchViewModel()

    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(matchViewModel) // this can be used anywhere in the app, for different pages.
        }
    }
}
