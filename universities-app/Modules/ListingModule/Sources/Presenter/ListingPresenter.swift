//
//  ListingPresenter.swift
//
//
//  Created by Mohamed Fawzy on 24/06/2024.
//

import Foundation

final class ListingPresenter {
    private weak var view: ListingViewProtocol?
    private let router: ListingRouterProtocol
    private let interactor: ListingInteractorInputProtocol
    private(set) var listingItems = [ListingItemDetail]()
    
    init(router: ListingRouterProtocol, interactor: ListingInteractorInputProtocol) {
        self.router = router
        self.interactor = interactor
    }
}

extension ListingPresenter: ListingPresenterProtocol  {
    var numberOfItems: Int {
        listingItems.count
    }
    
    var listingViewTitle: String {
        "Listing"
    }
    
    func viewDidLoad(view: any ListingViewProtocol) {
        self.view = view
        loadListins()
    }
    
    func listingItem(at indexPath: IndexPath) -> ListingItem? {
        guard let item = listingItems[safe: indexPath.row] else { return  nil}
        return ListingItem(item: item)
    }
    
    func didSelectItem(at indexPath: IndexPath) {
        guard let item = listingItems[safe: indexPath.row] else { return }
        router.pushDetailsView(item: item, delegate: self)
    }
    
    func didTapRetryButton() {
        loadListins()
    }

    private func loadListins() {
        view?.hideFailureMessage()
        view?.startLoadig()
        self.interactor.loadListins()
    }
}

extension ListingPresenter: ListingInteractorOutputProtocol {
    func loadListingSuccess(resutlt: [ListingItemDetail]) {
        view?.stopLoadig()
        listingItems.removeAll()
        listingItems.append(contentsOf: resutlt)
        view?.reloadListings()
    }
    
    func loadListingFailure(message: String) {
        view?.stopLoadig()
        view?.showFailureMessage(message)
    }
}

extension ListingPresenter: DetailToListingProtocol {
    func didRequestRefresh() {
        loadListins()
    }
}
