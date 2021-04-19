//
//  MediaImage.swift
//  Core
//
//  Created by Otavio Brito on 09/04/21.
//

import Foundation

public struct MediaImage: Decodable {
    private enum CodingKeys: String, CodingKey {
        case mediumImage = "medium"
    }
    public var mediumImage: String
}
