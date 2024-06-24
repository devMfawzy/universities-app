//
//  Endpoint.swift
//  
//
//  Created by Mohamed Fawzy on 24/06/2024.
//

import Foundation

enum Endpoint {
    case universitiesEndpoint
    
    var url: URL? {
        switch self {
        case .universitiesEndpoint:
            return URL(string: Constants.urlOfUniversitiesAPI)
        }
    }
}
