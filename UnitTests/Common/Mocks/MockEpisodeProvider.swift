//
//  MockEpisodeProvider.swift
//  UnitTests
//
//  Created by Otavio Brito on 14/04/21.
//

import Foundation
@testable import Core
@testable import PromiseKit

class MockEpisodeProvider: EpisodeProvider {
    static var mockEpisodes: [Episode] = []

    func retrieveEpisodes(showId: Int) -> Promise<[Episode]> {
        .value(Self.mockEpisodes)
    }
}
