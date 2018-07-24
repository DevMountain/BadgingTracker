//
//  LeadIntructor.swift
//  BadgingTracker
//
//  Created by Thao Doan on 6/27/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import UIKit

class LeadIntructor: Mentor {
    
    override var dictionaryRepresentation: [String : Any] {
        var dictionary = super.dictionaryRepresentation
        dictionary[Constants.isInstructorKey] = true
        return dictionary
    }
    
}
