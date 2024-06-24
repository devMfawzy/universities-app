//
//  ListingRouter.swift
//
//
//  Created by Mohamed Fawzy on 24/06/2024.
//

import UIKit

final class ListingRouter: ListingRouterProtocol {
    weak var view: UIViewController?
    
    func pushDetailsView(item: ListingItemDetail, delegate: DetailToListingProtocol) {
        let detailsView = DetailsModule.createModule(item: item, delegate: delegate)
        guard let viewController = detailsView as? UIViewController else { return }
        view?.navigationController?.pushViewController(viewController, animated: true)
    }
}
