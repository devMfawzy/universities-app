//
//  ListingItem.swift
//
//
//  Created by Mohamed Fawzy on 24/06/2024.
//

import Foundation

struct ListingItem {
    let name: String
    var state: String?
}

extension ListingItem {
    init(item: ListingItemDetail) {
        self.name = item.name
        self.state = item.state
    }
}
