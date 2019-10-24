//
//  NetworkRequestFactory+Events.swift
//  Museum
//
//  Created by Naste, Ishwar (US - Bengaluru) on 13/07/19.
//  Copyright © 2019 Naste, Ishwar (US - Bengaluru). All rights reserved.
//

import Foundation

extension NetworkRequestFactory {
    
    /**
     Function to create get events requests.
     - parameter baseUrl: Base url to get events
     - parameter forDate: Events for particular date
     - returns: Get events request
     */
    static func getEvents(baseUrl: String, forDate: Date) -> GetEventsRequest {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormat.monthDateYearShort
        let request = GetEventsRequest(url: baseUrl, forDate: dateFormatter.string(from: forDate))
        return request
    }

}
