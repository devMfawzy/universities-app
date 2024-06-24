//
//  ListingInteractor.swift
//
//
//  Created by Mohamed Fawzy on 24/06/2024.
//

import Foundation

final class ListingInteractor: ListingInteractorInputProtocol {
    weak var output: ListingInteractorOutputProtocol?
    
    private let repo: ListingRepoProtocol
    
    init(repo: ListingRepoProtocol) {
        self.repo = repo
    }
    
    func loadListins() {
        repo.getListings { result in
            switch result {
            case .success(let listing):
                self.output?.loadListingSuccess(resutlt: listing)
            case .failure(let error):
                self.output?.loadListingFailure(message: error.localizedDescription)
            }
        }
    }
}
