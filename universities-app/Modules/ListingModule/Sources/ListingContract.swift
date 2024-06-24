//
//  ListingContract.swift
//
//
//  Created by Mohamed Fawzy on 24/06/2024.
//

import Foundation

//MARK: - Contract agreement between module layers

protocol ListingViewProtocol: AnyObject {
    func reloadListings()
    func startLoadig()
    func stopLoadig()
    func showFailureMessage(_ message: String)
    func hideFailureMessage()
}

protocol ListingPresenterProtocol: AnyObject {
    var numberOfItems:Int { get }
    var listingViewTitle: String { get }
    func viewDidLoad(view: ListingViewProtocol)
    func listingItem(at indexPath: IndexPath) -> ListingItem?
    func didSelectItem(at indexPath: IndexPath)
    func didTapRetryButton()
}

protocol ListingInteractorInputProtocol: AnyObject {
    func loadListins()
}

protocol ListingInteractorOutputProtocol: AnyObject {
    func loadListingSuccess(resutlt: [ListingItemDetail])
    func loadListingFailure(message: String)
}

protocol ListingRouterProtocol: AnyObject {
    func pushDetailsView(item: ListingItemDetail, delegate: DetailToListingProtocol)
}

protocol ListingRepoProtocol: AnyObject {
    func getListings(completion: @escaping (Result<[ListingItemDetail], any Error>) -> Void)
}

protocol DetailToListingProtocol: AnyObject {
    func didRequestRefresh()
}
