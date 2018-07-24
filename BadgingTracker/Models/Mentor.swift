//
//  Mentor.swift
//  BadgingTracker
//
//  Created by Thao Doan on 6/26/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import Foundation

class Mentor: Student {
    
    override var dictionaryRepresentation: [String : Any] {
        var dictionary = super.dictionaryRepresentation
        dictionary[Constants.isMentorKey] = true
        return dictionary
    }
    
}
