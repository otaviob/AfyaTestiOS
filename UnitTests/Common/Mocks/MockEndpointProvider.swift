//
//  MockEndpointProvider.swift
//  UnitTests
//
//  Created by Otavio Brito on 14/04/21.
//
import Foundation
@testable import Core
@testable import PromiseKit

class MockEndpointProvider: EndpointProvider {
    static var mockUrl: URL?

    func url(for endpoint: Endpoint, with args: [CVarArg]) -> URL? {
        Self.mockUrl
    }
}
