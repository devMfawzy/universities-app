//
//  ListingService.swift
//
//
//  Created by Mohamed Fawzy on 24/06/2024.
//

import Foundation

final class ListingService: ListingServiceProtocol {
    private(set) var currentTask: URLSessionDataTask?

    public func fetchListings(completion: @escaping (Result<ListingDTOs, ListingFetchError>) -> Void) {
        guard let request = listingRequest else {
            completion(.failure(.invalidURLError))
            return
        }
        fetchData(request: request) { status  in
            switch status {
            case let .success(data):
                let decode = JSONDecoder()
                do {
                    let listing = try decode.decode(ListingDTOs.self, from: data)
                    completion(.success(listing))
                } catch {
                    completion(.failure(.decodingError))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
    
    private lazy var listingRequest: URLRequest? = {
        guard let url = Endpoint.universitiesEndpoint.url else {
            return nil
        }
        return URLRequest(url: url)
    }()
    
    private func fetchData(request: URLRequest, completion: @escaping (Result<Data, ListingFetchError>) -> Void) {
        currentTask = URLSession.shared.dataTask(with: request) { data, reponse, error in
            if let error {
                completion(.failure(.transportError(error.localizedDescription)))
                return
            }
            if let reponse = reponse as? HTTPURLResponse, !(200...299).contains(reponse.statusCode) {
                completion(.failure(.serverError))
                return
            }
            guard let data else {
                completion(.failure(.unknownError))
                return
            }
            completion(.success(data))
        }
        currentTask?.resume()
    }
}
