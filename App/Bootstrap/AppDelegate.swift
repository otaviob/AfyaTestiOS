//
//  AppDelegate.swift
//  App
//
//  Created by Otavio Brito on 05/04/21.
//

import Core
import Database
import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    lazy var injector = Injector()
    let coreDataProvider = CoreDataProvider()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Injecting the app dependencies
        injector.load()
        return true
    }
}
