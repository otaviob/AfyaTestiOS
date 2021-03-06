//
//  Person.swift
//  Core
//
//  Created by Otavio Brito on 09/04/21.
//

import Foundation

public struct Person: Decodable {
    private enum CodingKeys: CodingKey {
        case person
    }

    private struct PersonData: Decodable {
        private enum CodingKeys: CodingKey {
            case id
            case name
            case image
        }

        var id: Int
        var name: String
        var image: URL?
        var shows: [Show] = []

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decode(Int.self, forKey: .id)
            name = try values.decode(String.self, forKey: .name)
            let mediaImage = try? values.decode(MediaImage.self, forKey: .image)
            // Using medium images, to improve mobile performance
            image = URL(string: mediaImage?.mediumImage ?? "")
        }
    }

    public var id: Int
    public var name: String
    public var image: URL?
    public var shows: [Show]

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let personData = try values.decode(PersonData.self, forKey: .person)
        id = personData.id
        name = personData.name
        image = personData.image
        shows = personData.shows
    }

    public init() {
        id = 0
        name = ""
        image = nil
        shows = []
    }
}
