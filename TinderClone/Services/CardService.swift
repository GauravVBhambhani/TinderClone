//
//  CardService.swift
//  TinderClone
//
//  Created by Gaurav Bhambhani on 2/16/25.
//

import Foundation

struct CardService {
    func fetchMockCards() async throws -> [Card] {
        let users = MockData.users
        return users.map({ Card(user: $0) })
    }
}

struct MockData {
    static let users: [User] = [
        .init(id: UUID().uuidString, fullname: "Gaurav Bhambhani", age: 23, profileImageURLs: ["gaurav", "gaurav2", "gaurav3"]),
        .init(id: UUID().uuidString, fullname: "Keerthana Panyam", age: 23, profileImageURLs: ["keerthana", "keerthana2"]),
        .init(id: UUID().uuidString, fullname: "Tanvi Kakde", age: 25, profileImageURLs: ["tanvi", "tanvi2"]),
        .init(id: UUID().uuidString, fullname: "Shraavya Rao", age: 24, profileImageURLs: ["shraavya"])
    ]
}
