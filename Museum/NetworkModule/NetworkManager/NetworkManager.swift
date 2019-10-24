//
//  NetworkManager.swift
//  Museum
//
//  Created by Naste, Ishwar (US - Bengaluru) on 13/07/19.
//  Copyright © 2019 Naste, Ishwar (US - Bengaluru). All rights reserved.
//

import SwiftyJSON

class NetworkManager {
    
    ///NetworkManager singleton instance
    static let sharedInstance = NetworkManager()
    
    /**
     Generic Function to execute Network request.
     
     - parameter request: NetworkRequestConvertible request which is to be executed
     - parameter parseBlock: Block to specify to parse destination response object
     - parameter success: If executeRequest() function returns success then response object will be returned back in success block
     - parameter failure: If executeRequest() function returns failure then Error will be returned back in failure block
     */
    public func execute(request: NetworkRequestConvertible, parseBlock: @escaping ((JSON) -> (Any?)),
                        success: @escaping((Any) -> Void), failure: @escaping ((Error) -> ())) {
        
        request.execute(success: { (response) in
            if let parseResponse = parseBlock(JSON(response)) {
                success(parseResponse)
            } else {
                failure(NSError.init(domain: "Parse Error", code: 0, userInfo: nil))
            }
        }, failure: {(error) in
            failure(error)
        })
    }
}
