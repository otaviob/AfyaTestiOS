//
//  EpisodeProvider.swift
//  Core
//
//  Created by Otavio Brito on 09/04/21.
//

import PromiseKit

public protocol EpisodeProvider {
    func retrieveEpisodes(showId: Int) -> Promise<[Episode]>
}
