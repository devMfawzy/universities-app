//
//  File.swift
//  
//
//  Created by Mohamed Fawzy on 24/06/2024.
//

import Foundation

struct ListingItemDetail: Decodable, Equatable {
    let name: String
    let country: String
    let code: String
    let webPages: [String]
    var state: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case country
        case code = "alpha_two_code"
        case webPages = "web_pages"
        case state = "state-province"
    }
}

//extension ListingItemDetail {
//    init(object: ListingItemDAO) {
//        self.name = object.name
//        self.country = object.countryName
//        self.code = object.countryCode
//        self.webPages = object.webPages.map { $0 }
//        self.state = object.state
//    }
//}
