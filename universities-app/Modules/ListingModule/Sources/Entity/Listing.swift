//
//  Listing.swift
//
//
//  Created by Mohamed Fawzy on 25/06/2024.
//

import Foundation
import ListingRepo

typealias Listings = [Listing]

struct Listing {
    public let name: String
    public let country: String
    public let code: String
    public let webPages: [String]
    public var state: String?
}

extension Listing {
    init(_ dto: ListingItemDTO) {
        self.name = dto.name
        self.country = dto.country
        self.code = dto.code
        self.webPages = dto.webPages
        self.state = dto.state
    }
}

extension Listings {
    static func from(_ dto: ListingDTOs) -> Listings {
        dto.map { Listing($0)}
    }
}
