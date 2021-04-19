//
//  MockAuthProvider.swift
//  UnitTests
//
//  Created by Otavio Brito on 14/04/21.
//

import Foundation
@testable import Core
@testable import PromiseKit

class MockAuthProvider: AuthProvider {
    static var mockAuthType = AuthType.unsupported
    static var mockAuthenticateResult = false

    var authType: AuthType {
        Self.mockAuthType
    }
    
    func authenticate() -> Promise<Bool> {
        .value(Self.mockAuthenticateResult)
    }
}
