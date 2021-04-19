//
//  ScreenType.swift
//  Core
//
//  Created by Otavio Brito on 09/04/21.
//

import Foundation

// Family of devices, based on the screen size
// Useful create specific layouts
public enum ScreenType {
    case iPhone5to5C // 5, 5S, 5C
    case iPhone6to8 // 6, 6S, 7, 8
    case iPhone6to8Plus // 6Plus, 6SPlus, 7Plus, 8Plus
    case iPhoneXto11Pro // X, XS, 11Pro
    case iPhoneXSMaxTo11ProMax // XS Max, 11Pro Max
    case iPhoneXRto11 // XR, 11
    case unknown

    public var isSmallScreen: Bool {
        [.iPhone5to5C, .iPhone6to8].contains(self)
    }
}
