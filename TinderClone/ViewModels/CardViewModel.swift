//
//  CardViewModel.swift
//  TinderClone
//
//  Created by Gaurav Bhambhani on 2/16/25.
//

import Foundation

@MainActor
class CardViewModel: ObservableObject {
    @Published var cards = [Card]() // source of truth.
    @Published var buttonSwipeAction: SwipeAction?

    // initializing a service so that i can do dependency injection and use mock data to test.
    private let service: CardService
    init(service: CardService) {
        self.service = service
        Task {
            await fetchCards()
        }
    }

    func fetchCards() async {
        do {
            self.cards = try await service.fetchMockCards()
        } catch {
            print("Error: Failed to fetch cards with error \(error.localizedDescription).")
        }
    }

    func removeCard(_ card: Card) {
        guard let index = cards.firstIndex(where: { $0.id == card.id }) else { return } // find index of card that needs to be removed
        cards.remove(at: index) // remove that card
        print("Removed card from memory")
    }
}
