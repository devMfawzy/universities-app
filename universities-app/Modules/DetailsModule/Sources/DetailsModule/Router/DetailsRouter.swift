//
// DetailsRouter.swift
//
//
//  Created by Mohamed Fawzy on 25/06/2024.
//

import UIKit

final class DetailsRouter: DetailsRouterProtocol {
    weak var view: UIViewController?
    
    func popToListingsView() {
        view?.navigationController?.popViewController(animated: true)
    }
}
