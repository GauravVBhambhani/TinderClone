//
//  MatchViewModel.swift
//  TinderClone
//
//  Created by Gaurav Bhambhani on 2/17/25.
//

import Foundation

@MainActor // this will be updating the main thread...so...
class MatchViewModel: ObservableObject {

    @Published var matchedUser: User?

    func checkForMatch(withUser user: User) {
//        return Bool.random()
        let didMatch = Bool.random()

        if didMatch {
            matchedUser = user
        }
    }
}
