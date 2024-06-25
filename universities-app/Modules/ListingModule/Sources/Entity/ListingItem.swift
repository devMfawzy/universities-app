//
//  ListingItem.swift
//
//
//  Created by Mohamed Fawzy on 24/06/2024.
//

import Foundation
import ListingRepo

struct ListingItem {
    let name: String
    var state: String?
}

extension ListingItem {
    init(item: Listing) {
        self.name = item.name
        self.state = item.state
    }
}
