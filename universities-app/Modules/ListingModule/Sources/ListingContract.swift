//
//  ListingContract.swift
//
//
//  Created by Mohamed Fawzy on 24/06/2024.
//

import Foundation
import ListingRepo

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
    func loadListingSuccess(resutlt: Listings)
    func loadListingFailure(message: String)
}

protocol ListingRouterProtocol: AnyObject {
    func pushDetailsView(item: Listing, delegate: DetailToListingProtocol)
}

protocol DetailToListingProtocol: AnyObject {
    func didRequestRefresh()
}
