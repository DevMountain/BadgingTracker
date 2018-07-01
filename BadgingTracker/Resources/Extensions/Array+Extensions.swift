//
//  Array+Extensions.swift
//  BadgingTracker
//
//  Created by Christian Riboldi on 6/29/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import Foundation

extension Array {
    func toDictionary<T>(withDefaultValue defaultValue: T) -> [Element: T] {
        var dictionary = [Element:T]()
        for element in self {
            dictionary[element] = defaultValue
        }
        return dictionary
    }
}
