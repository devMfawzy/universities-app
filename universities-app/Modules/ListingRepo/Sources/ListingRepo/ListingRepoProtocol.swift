//
//  File.swift
//  
//
//  Created by Mohamed Fawzy on 24/06/2024.
//

import Foundation

public protocol ListingRepoProtocol: AnyObject {
    func getListings(completion: @escaping (Result<ListingDTO, Error>) -> Void)
}
