//
//  MockRequestProvider.swift
//  UnitTests
//
//  Created by Otavio Brito on 14/04/21.
//

import Foundation
@testable import Core
@testable import PromiseKit

class MockRequestProvider: RequestProvider {
    static var mockNetworkResponse: NetworkResponse?
    static var mockNetworkError: NetworkError?

    func request(endpoint: Endpoint, with args: CVarArg...) -> Promise<NetworkResponse> {
        if let mockNetworkResponse = Self.mockNetworkResponse {
            return .value(mockNetworkResponse)
        } else if let mockNetworkError = Self.mockNetworkError {
            return .init(error: mockNetworkError)
        } else {
            return .init(error: TestError.mockNotSet)
        }
    }
    
    func request(url: URL) -> Promise<NetworkResponse> {
        if let mockNetworkResponse = Self.mockNetworkResponse {
            return .value(mockNetworkResponse)
        } else if let mockNetworkError = Self.mockNetworkError {
            return .init(error: mockNetworkError)
        } else {
            return .init(error: TestError.mockNotSet)
        }
    }
}
