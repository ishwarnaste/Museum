//
//  CollectionManagementProtocol.swift
//  Museum
//
//  Created by Naste, Ishwar (US - Bengaluru) on 14/07/19.
//  Copyright © 2019 Naste, Ishwar (US - Bengaluru). All rights reserved.
//

import Foundation

protocol CollectionManagementProtocol {
    
    /**
     Function to return all collections from local DB.
     
     - returns: Collections array
     */
    func getCollections() -> [Collection]?

    /**
     Protocol function to get collections based on query string
     - parameter query: Query string
     */
    func fetchCollections(query: String)
}


extension CollectionManagementProtocol {
    
    func getCollections() -> [Collection]? {
        return Collection.getCollectionData()
    }

    
    func fetchCollections(query: String) {
        NetworkManager.sharedInstance.getCollection(for: query, success: { (result) in
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: NotificationIdentifiers.SyncCompleted), object: nil)
        }, failure: { (error) in
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: NotificationIdentifiers.SyncFailed), object: nil)
        })
    }
}
