//
//  Extension+Font.swift
//  MusListen
//
//  Created by Drolllted on 06.10.2024.
//

import UIKit

enum Fonts: String {
    case afacadFluxBlack = "AfacadFlux-Black"
    case afacadFluxBold = "AfacadFlux-Bold"
    case afacadFluxExtraBold = "AfacadFlux-ExtraBold"
    case afacadFluxExtraLight = "AfacadFlux-ExtraLight"
    case afacadFluxLight = "AfacadFlux-Light"
    case afacadFluxMedium = "AfacadFlux-Medium"
    case afacadFluxRegular = "AfacadFlux-Regular"
    case afacadFluxSemiBold = "AfacadFlux-SemiBold"
    case afacadFluxThin = "AfacadFlux-Thin"
}

extension UIFont {
    static func customFont(named: Fonts, size: CGFloat) -> UIFont? {
        UIFont(name: named.rawValue, size: size)
    }
}
