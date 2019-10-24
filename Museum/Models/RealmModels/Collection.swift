//
//  Collection.swift
//  Museum
//
//  Created by Naste, Ishwar (US - Bengaluru) on 14/07/19.
//  Copyright © 2019 Naste, Ishwar (US - Bengaluru). All rights reserved.
//

import RealmSwift
import SwiftyJSON

class Collection: MuseumObject {
    
    //MARK: - Model Properties
    @objc public dynamic var identifier: String? = UUID().uuidString
    @objc public dynamic var collectionId: String?
    @objc public dynamic var collectionObjectNumber: String?
    @objc public dynamic var collectionTitle: String?
    @objc public dynamic var collectionLongTitle: String?
    @objc public dynamic var collectionImageURL: String?
    

    /**
     convenience Initializer to initialize the Collection
     - parameter json : JSON object
     */
    public convenience init?(json: JSON) {
        
        guard let collectionId = json[CollectionDetailsKeys.collectionID].string,
            let collectionObjectNumber = json[CollectionDetailsKeys.collectionObjectNumber].string,
            let collectionTitle = json[CollectionDetailsKeys.collectionTitle].string,
            let collectionLongTitle = json[CollectionDetailsKeys.collectionLongTitle].string,
            let headerImage = json[CollectionDetailsKeys.collectionHeaderImage].dictionary,
            let collectionImageURL = headerImage[CollectionDetailsKeys.collectionHeaderImageURL]?.string else {
                print("Error while fetching Collection info from server")
                return nil
        }
        self.init()
        self.collectionId = collectionId
        self.collectionObjectNumber = collectionObjectNumber
        self.collectionTitle = collectionTitle
        self.collectionLongTitle = collectionLongTitle
        self.collectionImageURL = collectionImageURL

    }
    
    /**
     This function save(upsert) or create a new collection objects based on the JSON response received from the server
     
     - parameter json: JSON based on which object need to be updated
     
     - returns: Events object
     */
    @discardableResult
    class public func saveCollectionsOnGet(json: JSON) -> Collection? {
        guard let collectionObject = Collection(json: json) else {
            print("Error while mapping events data from server")
            return nil
        }
        collectionObject.save()
        return collectionObject
    }
    
    class public func getCollectionData() -> [Collection]? {
        guard let realmDB = DBManager.sharedInstance.database else {
            return nil
        }
        return Array(realmDB.objects(Collection.self))
    }

}
