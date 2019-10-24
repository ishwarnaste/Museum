//
//  GetCollectionsRequest.swift
//  Museum
//
//  Created by Naste, Ishwar (US - Bengaluru) on 14/07/19.
//  Copyright © 2019 Naste, Ishwar (US - Bengaluru). All rights reserved.
//

import Foundation

struct GetCollectionsRequest {
    
    let urlString: String
    let type: NetworkRequestType
    
    var headers: [String: String]?
    
    // MARK: - Initializers
    init(url: String, headers:[String: String]? = [:], searchQuery: String) {
        self.type = .collection
        self.urlString = url + String.init(format: NetworkRequestType.collection.urlString, searchQuery)
        self.headers = headers
    }
}

extension GetCollectionsRequest : NetworkRequestConvertible {
    
    func httpMethod() -> HTTPMethod {
        return .get
    }
    
    func execute(success: @escaping ((Any) -> Void), failure: @escaping ((Error) -> ())) {
        DataRequest.execute(dataRequest: self, success: { (response) in
            success(response)
        }, failure: { (error) in
            failure(error)
        })
    }
}
