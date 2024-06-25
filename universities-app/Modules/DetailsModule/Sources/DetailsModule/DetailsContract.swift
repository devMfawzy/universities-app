//
//  DetailsContract.swift
//  
//
//  Created by Mohamed Fawzy on 25/06/2024.
//

import Foundation

//MARK: - Contract agreement between module layers

public protocol DetailsViewProtocl: AnyObject {
    func show(item: ListingItemDetail)
}

protocol DetailsPresenterProtocol: AnyObject {
    var delegate: DetailToListingProtocol? { get set }
    func viewDidLoad(view: DetailsViewProtocl)
    func didTapRefreshButton()
}

protocol DetailsRouterProtocol: AnyObject {
    func popToListingsView()
}

public protocol DetailToListingProtocol: AnyObject {
    func didRequestRefresh()
}
