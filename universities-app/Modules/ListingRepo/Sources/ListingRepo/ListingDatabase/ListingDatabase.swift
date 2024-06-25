//
//  ListingDatabase.swift
//
//
//  Created by Mohamed Fawzy on 25/06/2024.
//

import RealmSwift

final class ListingDatabase: ListingDatabaseProtocol {
    public static let shared = ListingDatabase()
    private init() { }
    
    public func add(objects: ListingDAOs) {
        guard let realm = try? Realm() else { return }
        try? realm.write {
            realm.deleteAll()
            realm.add(objects)
        }
    }
    
    public func getAllObjects() -> ListingDAOs {
        guard let realm = try? Realm() else { return [] }
        return realm.objects(ListingItemDAO.self).map { $0 }
    }
}
