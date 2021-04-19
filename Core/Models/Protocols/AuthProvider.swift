//
//  AuthProvider.swift
//  Core
//
//  Created by Otavio Brito on 09/04/21.
//

import PromiseKit

public protocol AuthProvider {
    var authType: AuthType { get }
    func authenticate() -> Promise<Bool>
}
