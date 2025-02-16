//
//  CardView.swift
//  TinderClone
//
//  Created by Gaurav Bhambhani on 2/14/25.
//

import SwiftUI

struct CardView: View {

    // to implement drag gesture.
    // when we drag to left, we want to display "dislike" image (like a fade in effect as we swipe).
    // when we swipe right, we want to display a "like" image.
    @State private var xOffset: CGFloat = 0 // for horizontal positioning
    @State private var degrees: Double = 0 // for rotation


    @State private var currentImageIndex = 0
    @State private var mockImages = [
        "gaurav",
        "gaurav2",
        "gaurav3"
    ]

    var body: some View {

        VStack {
            Text("\(xOffset)")
                .background(.red)
                .foregroundStyle(.white)

            ZStack (alignment: .bottom) {
                ZStack (alignment: .top) {
                    Image(mockImages[currentImageIndex])
                        .resizable()
                        .scaledToFill()
                        .overlay {
                            ImageScrollingOverlay(currentImageIndex: $currentImageIndex, numberOfImages: mockImages.count)
                        }
                    // currentImageIndex is a binding here because we're updating currentImageIndex in ImageScrollingOverlay and then updating it in CardView.

                    CardImageIndicatorView(currentImageIndex: currentImageIndex, numberOfImages: mockImages.count)
                    // currentImageIndex is not a binding here because we only need to see the value.

                    SwipeActionIndicatorView(xOffset: $xOffset) // needs to depend on xoffset to set opacity of the text.
                    // so we ned to pass it as a binding.
                }

                UserInfoView()
                    .padding(.horizontal, 30)
            }
            .frame(width: SizeConstants.cardWidth, height: SizeConstants.cardHeight)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .offset(x: xOffset)
            .rotationEffect(.degrees(degrees))
            .animation(.snappy, value: xOffset)
            .gesture(
                DragGesture()
                    .onChanged(onDragChanged) // since it has the same input parameter, we dont have to give it
                    .onEnded(onDragEnded)
            )
        } // VStack
    }
}

private extension CardView {

    func onDragChanged(_ value: DragGesture.Value ) {
        xOffset = value.translation.width
        degrees = Double(value.translation.width / 25)
    }

    func onDragEnded(_ value: _ChangedGesture<DragGesture>.Value) {
        let width = value.translation.width

        // we take the absolute value because if we swipe left(-ve offset) it wil always be < 0.
        if abs(width) <= abs(SizeConstants.screenCutOff) {
            xOffset = 0
            degrees = 0
        }
    }
}

#Preview {
    CardView()
}
