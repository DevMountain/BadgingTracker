//
//  KEAssesment.swift
//  BadgingTracker
//
//  Created by Thao Doan on 6/27/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import Foundation

class KEAssesment {
    
    var hasBadge : Bool = false
    var requirements : [String]
    var assesmentDescription : UUID
    
    init(hasBadge: Bool, requirements: [String], assesmentDescription: UUID = UUID() ) {
        self.hasBadge = hasBadge
        self.requirements = requirements
        self.assesmentDescription = assesmentDescription
    }
}

