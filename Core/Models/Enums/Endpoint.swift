//
//  Endpoint.swift
//  Core
//
//  Created by Otavio Brito on 09/04/21.
//

import Foundation

// The MazeTV endpoints we use
public enum Endpoint: String {
    case retrieveShows = "RetrieveShows"
    case retrieveShow = "RetrieveShow"
    case retrieveShowsFromSearch = "RetrieveShowsFromSearch"
    case retrieveEpisodes = "RetrieveEpisodes"
    case retrievePeople = "RetrievePeople"
    case retrieveShowsFromPerson = "RetrieveShowsFromPerson"
}
