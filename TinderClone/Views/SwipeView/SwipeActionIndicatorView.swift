//
//  SwipeActionIndicatorView.swift
//  TinderClone
//
//  Created by Gaurav Bhambhani on 2/15/25.
//

import SwiftUI

struct SwipeActionIndicatorView: View {

    @Binding var xOffset: CGFloat

    var body: some View {

        // Why HStack ? We're gonna make 1 view with both indicators (like, dislike) and we will change opacity of both views.
        HStack {

            Text("LIKE")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundStyle(.green)
                .overlay {
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(.green, lineWidth: 2)
                        .frame(width: 100, height: 48)
                }
                .rotationEffect(.degrees(-45))
                .opacity(Double(xOffset / SizeConstants.screenCutOff))

            // logic: opacity needs to be b/w 0 & 1. as offset increases, we're constantly dividing it by screenCutOff so it gets closer to 1

            Spacer()

            Text("NOPE")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .overlay {
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(.red, lineWidth: 2)
                        .frame(width: 100, height: 48)
                }
                .rotationEffect(.degrees(45))
                .opacity(Double(xOffset / SizeConstants.screenCutOff) * -1)

            // similarly, here, for the value to stay between 0 & 1 , we're miultiplying it by -1. because xoffset would be negative.

        }
        .padding(40)
    }
}

#Preview {
    SwipeActionIndicatorView(xOffset: .constant(20))
}
