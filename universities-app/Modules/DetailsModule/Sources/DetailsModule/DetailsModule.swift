//
//  DetailsModule.swift
//
//
//  Created by Mohamed Fawzy on 25/06/2024.
//

import Foundation

public enum DetailsModule {
    public static func createModule(item: ListingItemDetail, delegate: DetailToListingProtocol) -> DetailsViewProtocl {
        let router = DetailsRouter()
        let presenter = DetailsPresenter(item: item, router: router)
        presenter.delegate = delegate
        let view = DetailsView(presenter: presenter)
        router.view = view
        return view
    }
}
