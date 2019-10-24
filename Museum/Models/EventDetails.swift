//
//  EventDetails.swift
//  Museum
//
//  Created by Naste, Ishwar (US - Bengaluru) on 13/07/19.
//  Copyright © 2019 Naste, Ishwar (US - Bengaluru). All rights reserved.
//

import Foundation

/// This struct is used to store event details of a particular event.
struct EventDetails {
    let eventIdentifier: String
    let name: String
    let description: String
    let price: String
    let date: Date
    let timing: String
}

extension EventDetails {
    init(json: [String: Any]) throws {
        
        guard let eventId = json[EventDetailsKeys.eventID] as? String else {
            throw SerializationError.missing("Missing :: eventId")
        }
        
        guard let eventExposition = json[EventDetailsKeys.eventExposition] as? [String: Any] else {
            throw SerializationError.missing("Missing :: eventExposition")
        }
        
        guard let name = eventExposition[EventDetailsKeys.eventName] as? String else {
            throw SerializationError.missing("Missing :: name")
        }
        
        guard let description = eventExposition[EventDetailsKeys.eventDescription] as? String else {
            throw SerializationError.missing("Missing :: description")
        }

        guard let eventPrice = eventExposition[EventDetailsKeys.eventPrice] as? [String: Any] else {
            throw SerializationError.missing("Missing :: eventPrice")
        }
        
        guard let amount = eventPrice[EventDetailsKeys.eventAmount] as? String else {
            throw SerializationError.missing("Missing :: amount")
        }

        guard let dateInString = json[EventDetailsKeys.eventDate] as? String else {
            throw SerializationError.missing("Missing :: eventDate")
        }

        guard let period = eventPrice[EventDetailsKeys.eventPeriod] as? [String: Any] else {
            throw SerializationError.missing("Missing :: period")
        }

        guard let eventTiming = period[EventDetailsKeys.eventTiming] as? String else {
            throw SerializationError.missing("Missing :: eventTiming")
        }
        
        let eventDate = Date().getDateFromString(dateInString: dateInString, format: DateFormat.serverDateTime)

        self.eventIdentifier = eventId
        self.name = name
        self.description = description
        self.price = amount
        self.date = eventDate
        self.timing = eventTiming
    }
}
