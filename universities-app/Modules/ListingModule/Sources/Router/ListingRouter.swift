//
//  ListingRouter.swift
//
//
//  Created by Mohamed Fawzy on 24/06/2024.
//

import UIKit
import DetailsModule

final class ListingRouter: ListingRouterProtocol {
    weak var view: UIViewController?
    
    func pushDetailsView(item: Listing, delegate: DetailToListingProtocol) {
        let detailsView = DetailsModule.createModule(item: ListingItemDetail.from(item), delegate: delegate)
        guard let viewController = detailsView as? UIViewController else { return }
         view?.navigationController?.pushViewController(viewController, animated: true)
    }
}

fileprivate extension ListingItemDetail {
    static func from(_ item: Listing) -> ListingItemDetail {
        return ListingItemDetail(name: item.name,
                          country: item.country,
                          code: item.code,
                          webPages: item.webPages,
                          state: item.state)
    }
}
