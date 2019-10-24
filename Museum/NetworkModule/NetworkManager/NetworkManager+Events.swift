//
//  NetworkManager+Events.swift
//  Museum
//
//  Created by Naste, Ishwar (US - Bengaluru) on 14/07/19.
//  Copyright © 2019 Naste, Ishwar (US - Bengaluru). All rights reserved.
//

import Foundation
import SwiftyJSON

extension NetworkManager {
    
    /**
     Extension method to fetch all events for particular date
     */
    func getAllEvents(forDate date: Date, success: @escaping ((Any?) -> Void), failure: @escaping ((Error) -> ())) {
        
        let dates = Date.getDates(from: date.startHourOfDate, to: date.addUnitToDate(unitType: .day, number: 6))
        dates.forEach { (eventDate) in
            let getEventsRequest = NetworkRequestFactory.getEvents(baseUrl: URLConstants.baseUrlEnglish, forDate: eventDate)
            let parseBlock = { (json: JSON) -> ([Event]?) in
                guard let events = json[EventDetailsKeys.options].array else {
                    print("Error while fetching events from server")
                    return (nil)
                }
                let eventsArray = events.compactMap { (entry) -> Event? in
                    return Event.saveEventsOnGet(json: entry)
                }
                UserDefaults.standard.set(date.startHourOfDate, forKey: UserDefaultsConstant.lastFetchedDate)
                return (eventsArray)
            }
            execute(request: getEventsRequest, parseBlock: parseBlock, success: { (result) in
                success(result)
            }, failure: { (error) in
                failure(error)
            })

        }
    }
}
