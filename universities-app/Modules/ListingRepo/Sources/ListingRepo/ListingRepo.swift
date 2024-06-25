//
//  ListingRepo.swift
//
//
//  Created by Mohamed Fawzy on 24/06/2024.
//

import Foundation

final public class ListingRepo: ListingRepoProtocol {
    private let service: ListingServiceProtocol
    private let database: ListingDatabaseProtocol

    public convenience init() {
        self.init(service: ListingService(),
                  database: ListingDatabase.shared)
    }
    
    init(service: ListingServiceProtocol,
         database: ListingDatabaseProtocol) {
        self.service = service
        self.database = database
    }
    
    public func getListings(completion: @escaping (Result<ListingDTOs, Error>) -> Void) {
        service.fetchListings { [weak self] result in
            switch result {
            case .success(let items):
                self?.updateDatabase(items: items)
                completion(.success(items))
            case .failure(let error):
                if let savedItems = self?.getAllItems(), savedItems.count > 0 {
                    completion(.success(savedItems))
                } else {
                    completion(.failure(error))
                }
            }
        }
    }
    
    private func updateDatabase(items: ListingDTOs) {
        let objects = items.map { ListingItemDAO(object: $0) }
        database.add(objects: objects)
    }
    
    private func getAllItems() ->  ListingDTOs {
        database.getAllObjects().map { ListingItemDTO(object: $0) }
    }
}
