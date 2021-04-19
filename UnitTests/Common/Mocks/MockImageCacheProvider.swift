//
//  MockImageCacheProvider.swift
//  UnitTests
//
//  Created by Otavio Brito on 14/04/21.
//

import Foundation
@testable import Core
@testable import PromiseKit

class MockImageCacheProvider: ImageCacheProvider {
    static var mockSaveCalled = false
    static var mockImage: UIImage?

    func save(_ image: UIImage, for url: URL) {
        Self.mockSaveCalled = true
    }
    
    func retrieve(_ url: URL) -> UIImage? {
        Self.mockImage
    }
}
