//
//  StatusCode.swift
//  Core
//
//  Created by Otavio Brito on 09/04/21.
//
import Foundation

// HTTP status codes we use
public enum StatusCode: Int {
    case notFound = 404
    case tooManyRequests = 429
    case other
}
