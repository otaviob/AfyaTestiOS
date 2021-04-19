//
//  SecretProvider.swift
//  Core
//
//  Created by Otavio Brito on 09/04/21.
//

public protocol SecretProvider {
    func save(key: SecretKey, value: String)
    func retrieve(key: SecretKey) -> String
}
