//
//  ShowProvider.swift
//  Core
//
//  Created by Otavio Brito on 09/04/21.
//

import PromiseKit

public protocol ShowProvider {
    func retrieveShows(page: Int) -> Promise<[Show]>
    func retrieveShows(searchTerm: String) -> Promise<[Show]>
    func retrieveShow(id: Int) -> Promise<Show>
    func retrieveEpisodes(show: Show) -> Promise<Show>
}
