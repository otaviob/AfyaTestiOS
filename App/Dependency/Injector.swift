//
//  Injector.swift
//  App
//
//  Created by Otavio Brito on 05/04/21.
//

import Auth
import Cloud
import Core
import Database
import Secure

class Injector {
    func load() {
        Dependency.register(ImageCacheProvider.self) {
            NSImageCacheProvider()
        }

        Dependency.register(EndpointProvider.self) {
            PlistEndpointProvider()
        }

        Dependency.register(RequestProvider.self) {
            NetworkRequestProvider()
        }

        Dependency.register(ShowProvider.self) {
            NetworkShowProvider()
        }

        Dependency.register(EpisodeProvider.self) {
            NetworkEpisodeProvider()
        }

        Dependency.register(PersonProvider.self) {
            NetworkPersonProvider()
        }

        Dependency.register(FavoriteProvider.self) {
            CoreDataFavoriteProvider()
        }

        Dependency.register(SettingsProvider.self) {
            CoreDataSettingsProvider()
        }

        Dependency.register(SecretProvider.self) {
            KeychainSecretProvider()
        }

        Dependency.register(AuthProvider.self) {
            BiometricsAuthProvider()
        }
    }
}
