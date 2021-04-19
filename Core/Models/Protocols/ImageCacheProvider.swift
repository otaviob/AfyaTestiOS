//
//  ImageCacheProvider.swift
//  Core
//
//  Created by Otavio Brito on 09/04/21.
//

import UIKit

public protocol ImageCacheProvider {
    func save(_ image: UIImage, for url: URL)
    func retrieve(_ url: URL) -> UIImage?
}
