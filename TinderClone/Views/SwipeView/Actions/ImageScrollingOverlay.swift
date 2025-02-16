//
//  ImageScrollingOverlay.swift
//  TinderClone
//
//  Created by Gaurav Bhambhani on 2/15/25.
//

import SwiftUI

struct ImageScrollingOverlay: View {

    @Binding var currentImageIndex: Int
    let numberOfImages: Int

    var body: some View {
        HStack {
            Rectangle()
                .onTapGesture {
                    updateImageIndex(increment: false)
                }

            Rectangle()
                .onTapGesture {
                    updateImageIndex(increment: true)
                }
        }
        .foregroundStyle(.white.opacity(0.01))
    }
}

private extension ImageScrollingOverlay {
    func updateImageIndex(increment: Bool) {
        if increment {
            guard currentImageIndex < numberOfImages - 1 else { return } // wall

            currentImageIndex += 1
        } else {
            guard currentImageIndex > 0 else { return }
            
            currentImageIndex -= 1
        }
    }
}

#Preview {
    ImageScrollingOverlay(currentImageIndex: .constant(1), numberOfImages: 3)
}
