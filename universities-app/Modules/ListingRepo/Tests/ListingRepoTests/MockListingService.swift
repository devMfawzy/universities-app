//
//  MockListingService.swift
//
//  Created by Mohamed Fawzy on 24/06/2024.
//

import Foundation
@testable import ListingRepo

final class MockListingService: ListingServiceProtocol {
    private var expectedResult: Result<ListingDTOs, ListingFetchError>?
    
    func fetchListings(completion: @escaping (Result<ListingDTOs, ListingFetchError>) -> Void) {
        if let expectedResult {
            completion(expectedResult)
        }
    }
    
    func expect(_ result: Result<ListingDTOs, ListingFetchError>) {
        expectedResult = result
    }
}
