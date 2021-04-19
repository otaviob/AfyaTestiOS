//
//  NetworkError.swift
//  Core
//
//  Created by Otavio Brito on 09/04/21.
//
import Foundation

public enum NetworkError: String, Error {
    case invalidUrl = "The endpoint url is invalid"
    case dataNotFound = "The data was not found"
    case lastPageAchieved = "The last page was achieved"
    case parseFailed = "The parsing of thee network response failed"
    case rateLimitAchieved = "The rate limit was achieved"
}
