//
//  MainTab.swift
//  Core
//
//  Created by Otavio Brito on 09/04/21.
//

// The main tabs of the app
public enum MainTab: Int {
    case shows
    case people
    case favorites
    case settings

    public var title: String {
        switch self {
        case .shows: return "Shows".localized
        case .people: return "People".localized
        case .favorites: return "Favorites".localized
        case .settings: return "Settings".localized
        }
    }
}
