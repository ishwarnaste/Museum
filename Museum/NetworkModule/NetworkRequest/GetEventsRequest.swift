//
//  GetEventsRequest.swift
//  Museum
//
//  Created by Naste, Ishwar (US - Bengaluru) on 13/07/19.
//  Copyright © 2019 Naste, Ishwar (US - Bengaluru). All rights reserved.
//

import Foundation

struct GetEventsRequest {
    
    let urlString: String
    let type: NetworkRequestType

    var headers: [String: String]?
    
    // MARK: - Initializers
    init(url: String, headers:[String: String]? = [:], forDate: String) {
        self.type = .agenda
        self.urlString = url + String.init(format: NetworkRequestType.agenda.urlString, forDate)
        self.headers = headers
    }
}

/**
 Extension of `MHNetworkRequestConvertible` protocol
 */
extension GetEventsRequest: NetworkRequestConvertible {
    
    func httpMethod() -> HTTPMethod {
        return .get
    }
    
    func execute(success: @escaping((Any) -> Void), failure: @escaping ((Error) -> ())) {
        DataRequest.execute(dataRequest: self, success: { (response) in
            success(response)
        }, failure: { (error) in
            failure(error)
        })
    }
}

