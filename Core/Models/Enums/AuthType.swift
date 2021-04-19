//
//  AuthType.swift
//  Core
//
//  Created by Otavio Brito on 09/04/21.
//

import Foundation

// The authentication types. Unsupported means, we
// will use the custom PIN
public enum AuthType {
    case touchID
    case faceID
    case unsupported

    public var title: String {
        switch self {
        case .touchID: return "Touch ID".localized
        case .faceID: return "Face ID".localized
        case .unsupported: return "Unsupported".localized
        }
    }
}
