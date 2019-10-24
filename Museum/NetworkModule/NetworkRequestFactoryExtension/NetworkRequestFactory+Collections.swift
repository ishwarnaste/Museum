//
//  NetworkRequestFactory+Collections.swift
//  Museum
//
//  Created by Naste, Ishwar (US - Bengaluru) on 14/07/19.
//  Copyright © 2019 Naste, Ishwar (US - Bengaluru). All rights reserved.
//

import Foundation

extension NetworkRequestFactory {
    
    /**
     Function to create get collection requests.
     - parameter baseUrl: Base url to get events
     - parameter searchQuery: Search query
     - returns: Get collections request
     */
    static func getCollections(baseUrl: String, searchQuery: String) -> GetCollectionsRequest {
        let request = GetCollectionsRequest(url: baseUrl, searchQuery: searchQuery)
        return request
    }

}
