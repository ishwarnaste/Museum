//
//  NetworkManager+Collections.swift
//  Museum
//
//  Created by Naste, Ishwar (US - Bengaluru) on 14/07/19.
//  Copyright © 2019 Naste, Ishwar (US - Bengaluru). All rights reserved.
//

import SwiftyJSON

extension NetworkManager {
    
    func getCollection(for searchQuery:String, success: @escaping ((Any?) -> Void), failure: @escaping ((Error) -> ())) {
        
        let getCollectionRequest = NetworkRequestFactory.getCollections(baseUrl: URLConstants.baseUrlEnglish, searchQuery: searchQuery)
        
        let parseBlock = { (json: JSON) -> ([Collection]?) in
            
            guard let collections = json[CollectionDetailsKeys.artObjects].array else {
                print("Error while fetching collections from server")
                return (nil)
            }
            
            let collectionsArray = collections.compactMap { (entry) -> Collection? in
                return Collection.saveCollectionsOnGet(json: entry)
            }
            return (collectionsArray)
        }
        
        execute(request: getCollectionRequest, parseBlock: parseBlock, success: { (result) in
            success(result)
        }, failure: { (error) in
            failure(error)
        })
    }
}
