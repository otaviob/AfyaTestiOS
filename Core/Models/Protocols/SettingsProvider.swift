//
//  SettingsProvider.swift
//  Core
////  Created by Otavio Brito on 09/04/21.
//

import PromiseKit

public protocol SettingsProvider {
    func save(_ settings: Settings) -> Promise<Void>
    func retrieveSettings() -> Promise<Settings>
}
