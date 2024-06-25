//
//  ListingItemDetail.swift
//
//
//  Created by Mohamed Fawzy on 25/06/2024.
//

import Foundation

public struct ListingItemDetail {
    let name: String
    let country: String
    let code: String
    let webPages: [String]
    var state: String?
    
    public init(name: String, country: String, code: String, webPages: [String], state: String? = nil) {
        self.name = name
        self.country = country
        self.code = code
        self.webPages = webPages
        self.state = state
    }
}
