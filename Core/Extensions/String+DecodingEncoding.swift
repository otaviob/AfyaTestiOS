//
//  String+DecodingEncoding.swift
//  Core
//
//  Created by Otavio Brito on 09/04/21.
//

import Foundation

public extension String {
    // Decoded HTML strings removing tags
    var htmlDecoded: String {
        guard let stringData = data(using: .utf8) else {
            return ""
        }
        let attributedString = try? NSAttributedString(
            data: stringData,
            options: [
                .documentType: NSAttributedString.DocumentType.html,
                .characterEncoding: String.Encoding.utf8.rawValue
            ],
            documentAttributes: nil
        )
        return attributedString?.string ?? ""
    }

    // Encode URL strings, adding percent encoding
    var urlEncoded: String {
        addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
}
