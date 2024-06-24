//
//  ListingServiceProtocol.swift
//  
//
//  Created by Mohamed Fawzy on 24/06/2024.
//

import Foundation

public protocol ListingServiceProtocol {
    func fetchListings(completion: @escaping (Result<Listings, ListingFetchError>) -> Void)
}
