//
//  NetworkEpisodeProvider.swift
//  Cloud
//
//  Created by Otavio Brito on 07/04/21.
//

import Core
import PromiseKit

public class NetworkEpisodeProvider: EpisodeProvider {
    // This queue is used to parse the response out of the main thread
    static let queue = DispatchQueue(label: "NetworkEpisodeProvider")
    lazy var requestProvider = Dependency.resolve(RequestProvider.self)
    lazy var decoder = JSONDecoder()

    public init() {
    }

    // Retrieve the episodes for a show id
    public func retrieveEpisodes(showId: Int) -> Promise<[Episode]> {
        // Performs the request
        requestProvider
            .request(endpoint: .retrieveEpisodes, with: showId)
            .map(on: Self.queue) { [weak self] data, statusCode -> [Episode] in
                if statusCode == .notFound {
                    throw NetworkError.dataNotFound
                }
                // Parses the data
                guard let episodes = (try? self?.decoder.decode([Episode].self, from: data)) else {
                    throw NetworkError.parseFailed
                }
                return episodes
            }
    }
}
