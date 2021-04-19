//
//  FavoriteProvider.swift
//  Core
//
//  Created by Otavio Brito on 09/04/21.
//

import PromiseKit

public protocol FavoriteProvider {
    var onDataChange: ((_ favorites: [Favorite]) -> Void)? { get set }
    func save(_ favorite: Favorite) -> Promise<Void>
    func delete(_ favorite: Favorite) -> Promise<Void>
    func retrieveFavorites() -> Promise<[Favorite]>
}
