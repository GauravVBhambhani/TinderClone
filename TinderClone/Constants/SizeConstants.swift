//
//  SizeConstants.swift
//  TinderClone
//
//  Created by Gaurav Bhambhani on 2/15/25.
//

import SwiftUI

struct SizeConstants {

    static var cardWidth: CGFloat {
        UIScreen.main.bounds.width - 20
    }

    static var cardHeight: CGFloat {
        UIScreen.main.bounds.height / 1.45
    }

    // to handle drag gesture for all screen sizes
    static var screenCutOff: CGFloat {
        ( UIScreen.main.bounds.width / 2 ) * 0.8
    } // calculates 80% of the half of the Full Screen width.
    //    if full screen width = 400
    //    half = 200
    //    * 0.8 = 200 * 0.8 = 160
    //    if drag offset is more that 160 points on that screen, consider it swiped.

}

// changed everything to static because we dont want to initialize anything.
