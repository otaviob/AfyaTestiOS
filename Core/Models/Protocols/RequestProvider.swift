//
//  RequestProvider.swift
//  Core
//
//  Created by Otavio Brito on 09/04/21.
//

import PromiseKit

public typealias NetworkResponse = (Data, StatusCode)

public protocol RequestProvider {
    func request(endpoint: Endpoint, with args: CVarArg...) -> Promise<NetworkResponse>
    func request(url: URL) -> Promise<NetworkResponse>
}
