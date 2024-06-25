//
//  ListingRecord.swift
//  
//
//  Created by Mohamed Fawzy on 24/06/2024.
//

import Foundation

public typealias ListingDTOs = [ListingItemDTO]

public struct ListingItemDTO: Decodable, Equatable {
    public let name: String
    public let country: String
    public let code: String
    public let webPages: [String]
    public var state: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case country
        case code = "alpha_two_code"
        case webPages = "web_pages"
        case state = "state-province"
    }
}

extension ListingItemDTO {
    init(object: ListingItemDAO) {
        self.name = object.name
        self.country = object.countryName
        self.code = object.countryCode
        self.webPages = object.webPages.map { $0 }
        self.state = object.state
    }
}
