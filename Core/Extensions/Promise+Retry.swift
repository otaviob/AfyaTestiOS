//
//  Promise+Retry.swift
//  Core
//
//  Created by Otavio Brito on 09/04/21.
//

import PromiseKit

public extension Promise {
    // Retry a promise a number of times with a delay interval.
    // Useful to retry requests, for instance
    @discardableResult static func retry<T>(times: Int, wait: TimeInterval = 5.0, body: @escaping () -> Promise<T>) -> Promise<T> {
        var attempts = times
        func attempt() -> Promise<T> {
            body().recover { error -> Promise<T> in
                attempts -= 1
                guard attempts > 0 else { throw error }
                return after(seconds: wait).then(attempt)
            }
        }
        return attempt()
    }
}
