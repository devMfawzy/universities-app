//
//  ListingInteractor.swift
//
//
//  Created by Mohamed Fawzy on 24/06/2024.
//

import Foundation
import ListingRepo

final class ListingInteractor: ListingInteractorInputProtocol {
    weak var output: ListingInteractorOutputProtocol?
    private let repo: ListingRepoProtocol
    
    init(repo: ListingRepoProtocol) {
        self.repo = repo
    }
    
    func loadListings() {
        repo.getListings { result in
            switch result {
            case .success(let dto):
                self.output?.loadListingSuccess(resutlt: Listings.from(dto))
            case .failure(let error):
                self.output?.loadListingFailure(message: error.localizedDescription)
            }
        }
    }
}
