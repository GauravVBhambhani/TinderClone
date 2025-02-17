//
//  CardStackView.swift
//  TinderClone
//
//  Created by Gaurav Bhambhani on 2/16/25.
//

import SwiftUI

struct CardStackView: View {
    @StateObject var viewModel = CardViewModel(service: CardService())
//    @StateObject var matchViewModel = MatchViewModel()

    @EnvironmentObject var matchViewModel: MatchViewModel

    @State private var showMatchView = false

    var body: some View {
        // Currently, after swiping left or right, we are only removing the card from teh screen, but it still exists, so we will be using DSA to remove the cards after swipping logically.

        ZStack {
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
            .blur(radius: showMatchView ? 20 : 0)

            if showMatchView {
                MatchView(show: $showMatchView)
            }

        }
        .animation(.easeInOut, value: showMatchView)
        .onReceive(matchViewModel.$matchedUser) { user in
            showMatchView = user != nil
        }
    }
}

#Preview {
    CardStackView()
        .environmentObject(MatchViewModel())
}
