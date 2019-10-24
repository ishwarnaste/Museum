//
//  NetworkConstants.swift
//  Museum
//
//  Created by Naste, Ishwar (US - Bengaluru) on 13/07/19.
//  Copyright © 2019 Naste, Ishwar (US - Bengaluru). All rights reserved.
//

/**
 URLConstants to store base url.
 */
struct URLConstants {
    static let baseUrlEnglish = "https://www.rijksmuseum.nl/api/en"
    static let baseUrlDutch = "https://www.rijksmuseum.nl/api/nl"
}

/**
 NetworkRequestType defines the different type of request
 */
public enum NetworkRequestType: String {
    case agenda
    case collection
    
    var urlString : String {
        switch self {
        case .agenda:
            return "/agenda/%@?key=yW6uq3BV&format=json"
        case .collection:
            return "/collection/?q=%@&key=yW6uq3BV&ps=50"
        }
    }
}


/// A dictionary of headers to apply to a `URLRequest`.
public typealias HTTPHeaders = [String: String]

/// A dictionary of parameters to apply to a `URLRequest`.
public typealias Parameters = [String: Any]

/// HTTP methods
public enum HTTPMethod: String {
    case get     = "GET"
}
