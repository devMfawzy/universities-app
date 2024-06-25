//
//  ListingRepo.swift
//
//
//  Created by Mohamed Fawzy on 24/06/2024.
//

import Foundation

final public class ListingRepo: ListingRepoProtocol {
    private let service: ListingServiceProtocol

    public init(service: ListingServiceProtocol = ListingService()) {
        self.service = service
    }
    
    public func getListings(completion: @escaping (Result<ListingDTO, Error>) -> Void) {
        service.fetchListings { result in
            switch result {
            case .success(let items):
                completion(.success(items))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
