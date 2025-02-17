//
//  Card.swift
//  TinderClone
//
//  Created by Gaurav Bhambhani on 2/16/25.
//

import Foundation

struct Card {
    let user: User
}

extension Card : Identifiable, Hashable {
    var id: String {
        user.id
    }
}
