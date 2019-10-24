//
//  NetworkRequestConvertible.swift
//  Museum
//
//  Created by Naste, Ishwar (US - Bengaluru) on 13/07/19.
//  Copyright © 2019 Naste, Ishwar (US - Bengaluru). All rights reserved.
//

import Foundation

/**
 Delegate for specifying network request details for implementing class
 */
public protocol NetworkRequestConvertible {
    
    /// URL string to be appended to base URL
    var urlString: String { get }

    /// Request type
    var type: NetworkRequestType? { get }

    /// Additional headers to add to the `URLRequest`
    var headers: HTTPHeaders? { get set }

    /**
     Initializes the http method to apply to a `URLRequest`.
     
     - returns: The adapted `HTTPMethod`.
     */
    func httpMethod() -> HTTPMethod

    /**
     Function for specify additional parameters
     */
    func parameters() -> Parameters?
    
    /**
     Function for executing the Network request
     
     - parameter success: If success then response object will be returned back in success block
     - parameter failure: If failure then Error will be returned back in failure block
     */
    func execute(success: @escaping((Any) -> Void), failure: @escaping ((Error) -> ()))
}


public extension NetworkRequestConvertible {
    
    /**
     Default definition of type variable.
     If a confirming class does not provide any implementation, then by default it is return as nil.
     */
    var type: NetworkRequestType? {
        return nil
    }

    /**
     Default definition of headers variable.
     If a confirming class does not provide any implementation, then by default it is return as nil.
     */
    var headers: HTTPHeaders? {
        get {
            return nil
        }
        set(newValue) {
            headers = newValue
        }
    }
    
    /**
     Default definition for parameters() function
     */
    func parameters() -> Parameters? {
        return nil
    }
    
    /**
     Default definition for execute() function
     */
    func execute(success: @escaping((Any) -> Void), failure: @escaping ((Error) -> ())) {}

}
