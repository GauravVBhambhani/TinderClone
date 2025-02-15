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

    var body: some View {

        VStack {
            Text("\(xOffset)")
                .background(.red)
                .foregroundStyle(.white)

            ZStack (alignment: .bottom) {
                Image(.gaurav)
                    .resizable()
                    .scaledToFill()

                UserInfoView()
                    .padding(.horizontal, 30)
            }
            .frame(width: cardWidth, height: cardHeight)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .offset(x: xOffset)
            .rotationEffect(.degrees(degrees))
            .animation(.snappy, value: xOffset)
            .gesture(
                DragGesture()
                    .onChanged(onDragChanged) // since it has the same input parameter, we dont have to give it
                    .onEnded(onDragEnded)
            )
        }
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
        if abs(width) <= abs(screenCutOff) {
            xOffset = 0
            degrees = 0
        } else {

        }
    }
}

extension CardView {
    var cardWidth: CGFloat {
        UIScreen.main.bounds.width - 20
    }

    var cardHeight: CGFloat {
        UIScreen.main.bounds.height / 1.45
    }

    // to handle drag gesture for all screen sizes
    var screenCutOff: CGFloat {
        ( UIScreen.main.bounds.width / 2 ) * 0.8
    } // calculates 80% of the half of the Full Screen width.
    //    if full screen width = 400
    //    half = 200
    //    * 0.8 = 200 * 0.8 = 160
    //    if drag offset is more that 160 points on that screen, consider it swiped.
}

#Preview {
    CardView()
}
