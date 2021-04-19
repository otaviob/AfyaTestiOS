//
//  MockSettingsProvider.swift
//  UnitTests
//
//  Created by Otavio Brito on 14/04/21.
//

import Foundation
@testable import Core
@testable import PromiseKit

class MockSettingsProvider: SettingsProvider {
    static var mockSettings: Settings?
    static var mockSaveCalled = false

    func save(_ settings: Settings) -> Promise<Void> {
        Self.mockSaveCalled = true
        return .value(())
    }
    
    func retrieveSettings() -> Promise<Settings> {
        if let mockSettings = Self.mockSettings {
            return .value(mockSettings)
        } else {
            return .init(error: TestError.mockNotSet)
        }
    }
}
