//
//  ListingDatabaseProtocol.swift
//
//
//  Created by Mohamed Fawzy on 25/06/2024.
//

import Foundation

protocol ListingDatabaseProtocol {
    func add(objects: ListingDAOs)
    func getAllObjects() -> ListingDAOs
}
