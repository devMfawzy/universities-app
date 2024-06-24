//
//  ListingModule.swift
//
//
//  Created by Mohamed Fawzy on 24/06/2024.
//

import UIKit

public enum ListingModule {
    public static func createModule() -> UIViewController {
        let router = ListingRouter()
        let repo = ListingRepo(service: ListingService())
        let interactor = ListingInteractor(repo: repo)
        let presenter = ListingPresenter(router: router, interactor: interactor)
        let view = ListingView(presenter: presenter)
        router.view = view
        interactor.output = presenter
        return view
    }
}
