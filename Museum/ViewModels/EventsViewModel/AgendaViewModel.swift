//
//  AgendaViewModel.swift
//  Museum
//
//  Created by Naste, Ishwar (US - Bengaluru) on 13/07/19.
//  Copyright © 2019 Naste, Ishwar (US - Bengaluru). All rights reserved.
//

import Foundation

struct AgendaViewModel : EventsManagementProtocol {
    
    // MARK: - Variables
    
    var events = [Event]()
    
    mutating func loadEvents() {
        if let eventsObjects = getEvents(fromDate: Date().startHourOfDate, toDate: Date().addUnitToDate(unitType: .day, number: 7)) {
            self.events = eventsObjects
        }
    }

}
