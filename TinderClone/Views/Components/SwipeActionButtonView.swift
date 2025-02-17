//
//  SwipeActionButtonView.swift
//  TinderClone
//
//  Created by Gaurav Bhambhani on 2/16/25.
//

import SwiftUI

struct SwipeActionButtonView: View {

    @ObservedObject var viewModel: CardViewModel

    var body: some View {
        HStack (spacing: 32) {

            Button {
                viewModel.buttonSwipeAction = .reject

            } label: {
                Image(systemName: "xmark")
                    .foregroundStyle(.red)
                    .fontWeight(.heavy)
                    .background(
                        Circle()
                            .fill(.white)
                            .frame(width: 50, height: 50)
                            .shadow(radius: 6)
                    )
            }
            .frame(width: 50, height: 50)

            Button {
                viewModel.buttonSwipeAction = .like
            } label: {
                Image(systemName: "heart.fill")
                    .foregroundStyle(.green)
                    .fontWeight(.heavy)
                    .background(
                        Circle()
                            .fill(.white)
                            .frame(width: 50, height: 50)
                            .shadow(radius: 6)
                    )
            }
            .frame(width: 50, height: 50)
        }
    }
}

#Preview {
    SwipeActionButtonView(viewModel: CardViewModel(service: CardService()))
}
