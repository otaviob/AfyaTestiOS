//
//  EndpointProvider.swift
//  Core
//
//  Created by Otavio Brito on 09/04/21.
//

import Foundation

public protocol EndpointProvider {
    func url(for endpoint: Endpoint, with args: [CVarArg]) -> URL?
}
