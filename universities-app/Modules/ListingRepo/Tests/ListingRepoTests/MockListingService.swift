//
//  MockListingService.swift
//
//  Created by Mohamed Fawzy on 24/06/2024.
//

import Foundation
@testable import ListingRepo

final class MockListingService: ListingServiceProtocol {
    private var expectedResult: Result<Listings, ListingFetchError>?
    
    func fetchListings(completion: @escaping (Result<Listings, ListingFetchError>) -> Void) {
        if let expectedResult {
            completion(expectedResult)
        }
    }
    
    func expect(_ result: Result<Listings, ListingFetchError>) {
        expectedResult = result
    }
}
