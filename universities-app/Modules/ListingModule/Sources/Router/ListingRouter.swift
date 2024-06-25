//
//  ListingRouter.swift
//
//
//  Created by Mohamed Fawzy on 24/06/2024.
//

import UIKit
import ListingRepo

final class ListingRouter: ListingRouterProtocol {
    weak var view: UIViewController?
    
    func pushDetailsView(item: Listing, delegate: DetailToListingProtocol) {
    }
}
