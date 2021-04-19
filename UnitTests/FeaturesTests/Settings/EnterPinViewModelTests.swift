//
//  EnterPinViewModelTests.swift
//  UnitTests
//
//  Created by Otavio Brito on 14/04/21.
//

import XCTest
@testable import Features
@testable import Core

class EnterPinViewModelTests: XCTestCase {
    lazy var injector = TestInjector()
    var viewModel: EnterPinViewModel?

    override func setUp() {
        super.setUp()
        injector.load()
        viewModel = EnterPinViewModel()
    }
    
    override func tearDown() {
        super.tearDown()
        injector.reset()
        viewModel = nil
    }

    func testSaveNewPin() {
        // Setup
        var isFinishAuthCalled: Bool?
        var isWrongPinCalled: Bool?
        viewModel?
            .onFinishAuth = { isFinishAuthCalled = true }
        viewModel?
            .onWrongPin = { isWrongPinCalled = true }

        // Given
        MockSecretProvider.mockSecrets = [:]
        XCTAssertNil(isFinishAuthCalled)
        XCTAssertNil(isWrongPinCalled)
        
        // When
        viewModel?.load()
        viewModel?.enterPin("1234")
        
        // Then
        XCTAssertEqual(isFinishAuthCalled, true)
        XCTAssertNil(isWrongPinCalled)
    }

    func testOldPinMismatch() {
        // Setup
        var isFinishAuthCalled: Bool?
        var isWrongPinCalled: Bool?
        viewModel?
            .onFinishAuth = { isFinishAuthCalled = true }
        viewModel?
            .onWrongPin = { isWrongPinCalled = true }

        // Given
        MockSecretProvider.mockSecrets[SecretKey.pin.rawValue] = "1234"
        XCTAssertNil(isFinishAuthCalled)
        XCTAssertNil(isWrongPinCalled)
        
        // When
        viewModel?.load()
        viewModel?.enterPin("1233")
        
        // Then
        XCTAssertNil(isFinishAuthCalled)
        XCTAssertEqual(isWrongPinCalled, true)
    }

    func testOldPinMatch() {
        // Setup
        var isFinishAuthCalled: Bool?
        var isWrongPinCalled: Bool?
        viewModel?
            .onFinishAuth = { isFinishAuthCalled = true }
        viewModel?
            .onWrongPin = { isWrongPinCalled = true }

        // Given
        MockSecretProvider.mockSecrets[SecretKey.pin.rawValue] = "1234"
        XCTAssertNil(isFinishAuthCalled)
        XCTAssertNil(isWrongPinCalled)
        
        // When
        viewModel?.load()
        viewModel?.enterPin("1234")
        
        // Then
        XCTAssertEqual(isFinishAuthCalled, true)
        XCTAssertNil(isWrongPinCalled)
    }
}
