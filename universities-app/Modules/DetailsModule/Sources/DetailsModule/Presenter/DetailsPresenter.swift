//
//  DetailsPresenter.swift
//  
//
//  Created by Mohamed Fawzy on 25/06/2024.
//

import Foundation

final class DetailsPresenter {
    private weak var view: DetailsViewProtocl?
    private let router: DetailsRouterProtocol
    private let item: ListingItemDetail
    weak var delegate: DetailToListingProtocol?
    
    init(item: ListingItemDetail, router: DetailsRouterProtocol) {
        self.router = router
        self.item = item
    }
}

extension DetailsPresenter: DetailsPresenterProtocol {
    func viewDidLoad(view: DetailsViewProtocl) {
        self.view = view
        self.view?.show(item: item)
    }
    
    func didTapRefreshButton() {
        router.popToListingsView()
        delegate?.didRequestRefresh()
    }
}
