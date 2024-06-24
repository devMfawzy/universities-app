//
//  ListingFetchError.swift
//  
//
//  Created by Mohamed Fawzy on 24/06/2024.
//

import Foundation

public enum ListingFetchError: Error, LocalizedError {
    case invalidURLError
    case transportError(String)
    case serverError
    case unknownError
    case decodingError
    
    public var errorDescription: String? {
        switch self {
        case .invalidURLError:
            "Invalid URL."
        case let .transportError(description):
            description
        case .serverError:
            "Server error"
        case .unknownError:
            "Unknown error occoured"
        case .decodingError:
            "Unexpected data format"
        }
    }
}
