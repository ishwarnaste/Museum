//
//  EventsManagementProtocol.swift
//  Museum
//
//  Created by Naste, Ishwar (US - Bengaluru) on 14/07/19.
//  Copyright © 2019 Naste, Ishwar (US - Bengaluru). All rights reserved.
//

import Foundation

protocol EventsManagementProtocol {

    /**
     Function to fetch events data from local DB.
     - parameter fromDate: fetch data from date
     - parameter toDate: fetch data till toDate
     - returns: Array of events that fall on the date ranges.
     */
    func getEvents(fromDate: Date, toDate: Date) -> [Event]?

    /**
     Protocol function to get upcomings weeks events
     */
    func fetchUpcomingWeeksEvents()

}

extension EventsManagementProtocol {
    
    func getEvents(fromDate: Date, toDate: Date) -> [Event]? {
        return Event.getAllEventsData(from: fromDate, toDate: toDate)
    }

    
    func fetchUpcomingWeeksEvents() {
        NetworkManager.sharedInstance.getAllEvents(forDate: Date(), success: { (result) in
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: NotificationIdentifiers.SyncCompleted), object: nil)
        }, failure: { (error) in
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: NotificationIdentifiers.SyncFailed), object: nil)
        })
    }
}
