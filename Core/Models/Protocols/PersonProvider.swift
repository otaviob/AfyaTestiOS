//
//  PersonProvider.swift
//  Core
//
//  Created by Otavio Brito on 09/04/21.
//

import PromiseKit

public protocol PersonProvider {
    func retrievePeople(searchTerm: String) -> Promise<[Person]>
    func loadShows(person: Person) -> Promise<Person>
}
