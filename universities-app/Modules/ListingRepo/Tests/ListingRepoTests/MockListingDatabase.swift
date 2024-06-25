//
//  MockListingDatabase.swift
//
//
//  Created by Mohamed Fawzy on 25/06/2024.
//

import Foundation
@testable import ListingRepo

final class MockListingDatabase: ListingDatabaseProtocol {
    private(set) var items = [ListingItemDAO]()
    
    func add(objects: [ListingItemDAO]) {
        items = objects
    }
    
    func getAllObjects() -> ListingDAOs {
        return items
    }
}
