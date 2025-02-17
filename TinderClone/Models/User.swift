//
//  User.swift
//  TinderClone
//
//  Created by Gaurav Bhambhani on 2/16/25.
//

import Foundation

struct User: Identifiable, Hashable {
    let id: String
    let fullname: String
    var age: Int
    var profileImageURLs: [String]
}
