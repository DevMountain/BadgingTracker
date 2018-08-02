//
//  Date+from.swift
//  BadgingTracker
//
//  Created by Christian Riboldi on 8/1/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import UIKit

extension Date {
    
    static func from(year: Int, month: Int, day: Int) -> Date {
        let gregorianCalendar = NSCalendar(calendarIdentifier: .gregorian)!
        
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        
        let date = gregorianCalendar.date(from: dateComponents)!
        return date
    }
}
