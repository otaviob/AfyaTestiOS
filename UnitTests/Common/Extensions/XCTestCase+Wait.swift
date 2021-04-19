//
//  XCTestCase+Wait.swift
//  UnitTests
//
//  Created by Otavio Brito on 14/04/21.
//

import XCTest

extension XCTestCase {
    func wait(timeout: TimeInterval) {
        let exp = expectation(description: UUID().uuidString)
        _ = XCTWaiter.wait(for: [exp], timeout: timeout)
    }
}
