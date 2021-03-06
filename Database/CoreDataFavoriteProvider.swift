//
//  CoreDataFavoriteProvider.swift
//  Database
//
//  Created by Otavio Brito on 11/04/21.
//

import Core
import CoreData
import PromiseKit

public class CoreDataFavoriteProvider: FavoriteProvider {
    private let context = CoreDataProvider.context
    private lazy var showProvider = Dependency.resolve(ShowProvider.self)
    public var onDataChange: ((_ favorites: [Favorite]) -> Void)?

    public init() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(contextObjectsDidChange(_:)),
            name: Notification.Name.NSManagedObjectContextObjectsDidChange,
            object: nil
        )
    }

    public func save(_ favorite: Favorite) -> Promise<Void> {
        Promise { seal in
            // Calling context's perform as we are in a private queue
            context.perform {
                let entity = NSEntityDescription.insertNewObject(forEntityName: "FavoriteEntity", into: self.context)
                entity.setValue(Int32(favorite.show.id), forKey: "showId")
                seal.fulfill(())
            }
        }
    }

    public func delete(_ favorite: Favorite) -> Promise<Void> {
        Promise { seal in
            // Calling context's perform as we are in a private queue
            context.perform {
                let request = NSFetchRequest<NSManagedObject>(entityName: "FavoriteEntity")
                request.resultType = .managedObjectResultType
                let showId = favorite.show.id as CVarArg
                request.predicate = NSPredicate(format: "showId == %d", showId)
                if let entity = try? self.context.fetch(request).first {
                    self.context.delete(entity)
                }
                seal.fulfill(())
            }
        }
    }

    public func retrieveFavorites() -> Promise<[Favorite]> {
        Promise { seal in
            // Calling context's perform as we are in a private queue
            context.perform {
                let request = NSFetchRequest<NSManagedObject>(entityName: "FavoriteEntity")
                request.resultType = .managedObjectResultType
                // First retrieve the stored showIds
                let results = try? self.context.fetch(request)
                let showIds = results?.compactMap { $0.value(forKey: "showId") as? Int32 } ?? []
                // Then retrieve the proper shows
                let shows = showIds.map { self.showProvider.retrieveShow(id: Int($0)) }
                when(fulfilled: shows)
                    .map { $0.map { Favorite(show: $0) } }
                    .done { favorites in
                        seal.fulfill(favorites)
                    }.cauterize()
            }
        }
    }

    @objc private func contextObjectsDidChange(_ notification: Notification) {
        // Notify listeners about data changes
        retrieveFavorites()
            .done { [weak self] favorites in
                self?.onDataChange?(favorites)
            }.cauterize()
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
