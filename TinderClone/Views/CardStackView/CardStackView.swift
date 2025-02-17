//
//  CardStackView.swift
//  TinderClone
//
//  Created by Gaurav Bhambhani on 2/16/25.
//

import SwiftUI

struct CardStackView: View {
    @StateObject var viewModel = CardViewModel(service: CardService())

    var body: some View {
        // Currently, after swiping left or right, we are only removing the card from teh screen, but it still exists, so we will be using DSA to remove the cards after swipping logically.

        VStack (spacing: 20) {
            ZStack {
                ForEach(viewModel.cards) { card in
                    CardView(card: card, viewModel: viewModel)
                }
            }

            if !viewModel.cards.isEmpty {
                SwipeActionButtonView(viewModel: viewModel)
            }
        }

    }
}

#Preview {
    CardStackView()
}
