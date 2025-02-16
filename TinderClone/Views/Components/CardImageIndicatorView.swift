//
//  CardImageIndicatorView.swift
//  TinderClone
//
//  Created by Gaurav Bhambhani on 2/15/25.
//

import SwiftUI

struct CardImageIndicatorView: View {

    let currentImageIndex: Int
    let numberOfImages: Int

    var body: some View {
        HStack {
            ForEach(0..<numberOfImages, id: \.self) { index in
                Capsule()
                    .foregroundStyle(
                        currentImageIndex == index ? .white : .gray
                    )
                    .frame(width: imageIndicatorWidth, height: 4)
                    .padding(.top, 8)
            }
        }
        .padding(.horizontal)
    }
}

private extension CardImageIndicatorView {
    var imageIndicatorWidth: CGFloat {
        SizeConstants.cardWidth / CGFloat(numberOfImages) - 28
    }
}

#Preview {
    CardImageIndicatorView(currentImageIndex: 1, numberOfImages: 2)
        .preferredColorScheme(.dark)
}
