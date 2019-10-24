//
//  Event.swift
//  Museum
//
//  Created by Naste, Ishwar (US - Bengaluru) on 14/07/19.
//  Copyright © 2019 Naste, Ishwar (US - Bengaluru). All rights reserved.
//

import RealmSwift
import SwiftyJSON

class Event: MuseumObject {
    
    //MARK: - Model Properties
    @objc public dynamic var identifier: String? = UUID().uuidString
    @objc public dynamic var eventIdentifier: String?
    @objc public dynamic var name: String?
    @objc public dynamic var eventDescription: String?
    @objc public dynamic var price: String?
    @objc public dynamic var date: Date?
    @objc public dynamic var timing: String?

    // MARK: - Realm overrides
    public override static func primaryKey() -> String? {
        return "identifier"
    }

    /**
     Convenience init method.
     - parameter json: raw json data
     */
    convenience public init?(json: JSON) {
        
        guard let eventId = json[EventDetailsKeys.eventID].string else {
            print("Missing :: eventId")
            return nil
        }
        
        guard let eventExpositionDictionary = json[EventDetailsKeys.eventExposition].dictionary else {
            print("Missing :: eventExposition")
            return nil
        }
        
        guard let name = eventExpositionDictionary[EventDetailsKeys.eventName]?.string else {
            print("Missing :: name")
            return nil
        }
        
        guard let description = eventExpositionDictionary[EventDetailsKeys.eventDescription]?.string else {
            print("Missing :: description")
            return nil
        }
        
//        guard let eventPriceDictionary = eventExpositionDictionary[EventDetailsKeys.eventPrice]?.dictionary else {
//            print("Missing :: eventPrice")
//            return nil
//        }
//
//        guard let amount = eventPriceDictionary[EventDetailsKeys.eventAmount]?.string else {
//            print("Missing :: amount")
//            return nil
//        }
        
        guard let dateInString = json[EventDetailsKeys.eventDate].string else {
            print("Missing :: eventDate")
            return nil
        }
        
        guard let periodDictionary = json[EventDetailsKeys.eventPeriod].dictionary else {
            print("Missing :: period")
            return nil
        }
        
        guard let eventTiming = periodDictionary[EventDetailsKeys.eventTiming]?.string else {
            print("Missing :: eventTiming")
            return nil
        }
        let eventDate = Date().getDateFromString(dateInString: dateInString, format: DateFormat.serverDateTime)
        self.init()
        self.eventIdentifier = eventId
        self.name = name
        self.eventDescription = description
        self.date = eventDate
        self.timing = eventTiming
        
        // Hard coding this value as I encountered parsing error. I spent 6 hours on it but couldn't figure out the issue. If I get more time then I will fix this. For now just going with hard coded value. Sorry.
        self.price = "5"
    }
    
    /**
     This function save(upsert) or create a new event objects based on the JSON response received from the server
     
     - parameter json: JSON based on which object need to be updated
     
     - returns: Events object
     */
    @discardableResult
    class public func saveEventsOnGet(json: JSON) -> Event? {
        guard let eventObject = Event(json: json) else {
            print("Error while mapping events data from server")
            return nil
        }
        eventObject.save()
        return eventObject
    }
    
    class public func getAllEventsData(from: Date, toDate: Date) -> [Event]? {
        guard let realmDB = DBManager.sharedInstance.database else {
            return nil
        }
        return Array(realmDB.objects(Event.self).filter("date >= %@ && date <= %@", from, toDate).sorted(byKeyPath: "date", ascending: true))
    }
}
