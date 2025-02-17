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

    let card: Card

    @ObservedObject var viewModel: CardViewModel

    var body: some View {

        VStack {
            Text("\(xOffset)")
                .background(.red)
                .foregroundStyle(.white)

            ZStack (alignment: .bottom) {
                ZStack (alignment: .top) {
                    Image(user.profileImageURLs[currentImageIndex])
                        .resizable()
                        .scaledToFill()
                        .frame(width: SizeConstants.cardWidth, height: SizeConstants.cardHeight)
                        .overlay {
                            ImageScrollingOverlay(currentImageIndex: $currentImageIndex, numberOfImages: imageCount)
                        }
                    // currentImageIndex is a binding here because we're updating currentImageIndex in ImageScrollingOverlay and then updating it in CardView.

                    CardImageIndicatorView(currentImageIndex: currentImageIndex, numberOfImages: imageCount)
                    // currentImageIndex is not a binding here because we only need to see the value.

                    SwipeActionIndicatorView(xOffset: $xOffset) // needs to depend on xoffset to set opacity of the text.
                    // so we ned to pass it as a binding.
                }

                UserInfoView(user: user)
            }
            .onReceive(viewModel.$buttonSwipeAction, perform: { action in
                onRecieveSwipeAction(action)
            })
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
        }
    }
}

private extension CardView {
    var user: User {
        card.user
    }

    var imageCount: Int {
        user.profileImageURLs.count
    }
}

private extension CardView {

    func returnToCenter() {
        xOffset = 0
        degrees = 0
    }

    func swipeRight() {
//        xOffset = 500
//        degrees = 12

//        viewModel.removeCard(card)

        // withAnimation has a body and completion, in the body we put what we want to execute, in the completion we put what we want to happen after the animation is complete.
        // Here we want to set the xOffset and degrees with animation, and after the animation is complete, we remove the card.

        withAnimation {
            xOffset = 500
            degrees = 12
        } completion: {
            viewModel.removeCard(card)
        }

    }

    func swipeLeft() {
//        xOffset = -500
//        degrees = -12
//        viewModel.removeCard(card)
        withAnimation {
            xOffset = -500
            degrees = -12
        } completion: {
            viewModel.removeCard(card)
        }
    }

    func onRecieveSwipeAction(_ action: SwipeAction?) {
        guard let action else { return } // make sure we have an action recieved from user. if nil, we don't have to perform any action


        // this logic is to make sure only the top card is swiped, if we dont do this, it will swipe on all the cards in the stack.
        let topCard = viewModel.cards.last // top most card is last card in array.

        if topCard == card {
            switch action {
            case .like:
                swipeRight()

            case .reject:
                swipeLeft()
            }
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
        if abs(width) <= abs(SizeConstants.screenCutOff) {
//            xOffset = 0
//            degrees = 0
            returnToCenter()
            return // stop the execution if return to center. dont execute if else checking to swipe. otherwise it will go through the logic and swipe left.
        }

        if width >= SizeConstants.screenCutOff {
            swipeRight()
        } else {
            swipeLeft()
        }
    }
}

#Preview {
    CardView(card: Card(user: MockData.users[0]), viewModel: CardViewModel(service: CardService()))
}
