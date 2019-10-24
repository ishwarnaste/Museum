//
//  Constants.swift
//  Museum
//
//  Created by Naste, Ishwar (US - Bengaluru) on 13/07/19.
//  Copyright © 2019 Naste, Ishwar (US - Bengaluru). All rights reserved.
//

/// This struct is used to parse the API data of Agenda with specified keys.
struct EventDetailsKeys {
    static let eventExposition = "exposition"
    static let eventName = "name"
    static let eventDescription = "description"
    static let eventPeriod = "period"
    static let eventTiming = "text"
    static let eventDate = "date"
    static let eventPrice = "price"
    static let eventAmount = "amount"
    static let eventID = "id"
    static let options = "options"
}

/// This struct is used to parse the API data of Artist Collection with specified keys.
struct CollectionDetailsKeys {
    static let artObjects = "artObjects"
    static let collectionID = "id"
    static let collectionObjectNumber = "objectNumber"
    static let collectionTitle = "title"
    static let collectionLongTitle = "longTitle"
    static let collectionHeaderImage = "headerImage"
    static let collectionHeaderImageURL = "url"
}


/// This struct is used to define date formats.
public struct DateFormat {
    static let serverDateTime = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
    static let serverDateTimeWithoutMilliseconds = "yyyy-MM-dd'T'HH:mm:ss'Z'"
    static let monthDateYearShort = "yyyy-MM-dd"
    static let monthShortDateYear = "MMM dd, yyyy"
}

/// Enum to throw any json parse error
public enum SerializationError: Error {
    case missing(String)
}

/// String literals
struct StringLiteral {
    static let emptyString = ""
    static let singleSpaceString = ""
}

///Notification identifiers
struct NotificationIdentifiers {
    /// Notification for data refresh changes on fetch completion
    static let SyncCompleted = "SyncCompleted"
    static let SyncFailed = "SyncFailed"
}

/// Custom Image dimensions
struct CustomImageWidth {
    static let smallThumbnailImageWidth = 150
    static let largeThumbnailImageWidth = 300
}

struct UserDefaultsConstant {
    static let lastFetchedDate = "lastFetchedDate"
}
