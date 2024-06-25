//
//  ListingItemDAO.swift
//  
//
//  Created by Mohamed Fawzy on 25/06/2024.
//

import RealmSwift

typealias ListingDAOs = [ListingItemDAO]

final class ListingItemDAO: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var name: String = ""
    @Persisted var countryName: String = ""
    @Persisted var countryCode: String = ""
    @Persisted var webPages = List<String>()
    @Persisted var state: String?
}

extension ListingItemDAO {
    convenience init(object: ListingItemDTO) {
        self.init()
        self.name = object.name
        self.countryName = object.country
        self.countryCode = object.code
        let webPages = List<String>()
        webPages.append(objectsIn: object.webPages)
        self.webPages = webPages
        self.state = object.state
    }
}
