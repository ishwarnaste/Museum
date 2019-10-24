//
//  Date+Extension.swift
//  Museum
//
//  Created by Naste, Ishwar (US - Bengaluru) on 13/07/19.
//  Copyright © 2019 Naste, Ishwar (US - Bengaluru). All rights reserved.
//

import Foundation

extension Date {
    
    /**
     Date extension method to convert date in string format to date format.
     - parameter dateInString: date in string format
     - parameter format: format of the original string
     - returns: converted string
     */
    public func getDateFromString(dateInString: String, format: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormat.serverDateTimeWithoutMilliseconds
        return dateFormatter.date(from: dateInString) ?? Date()
    }
    
    func addUnitToDate(unitType: Calendar.Component, number: Int) -> Date {
        return Calendar.current.date(byAdding: unitType, value: number, to: self)!
    }
    
    /// Returns end hour of date
    public var startHourOfDate: Date {
        return Calendar.current.startOfDay(for: self)
    }
    
    /**
     Function to get string for date format
     
     - returns: String object for specifed format.
     */
    func stringForFormat(_ format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
    /**
     Get dates between date ranges
     - parameter fromDate: start range
     - parameter toDate: end range
     - returns: Array of dates
     */
    static func getDates(from fromDate: Date, to toDate: Date) -> [Date] {
        var dates: [Date] = []
        var date = fromDate
        
        while date <= toDate {
            dates.append(date)
            guard let newDate = Calendar.current.date(byAdding: .day, value: 1, to: date) else { break }
            date = newDate
        }
        return dates
    }



}
