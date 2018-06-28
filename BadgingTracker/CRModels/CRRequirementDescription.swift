//
//  CRRequirementDescription.swift
//  BadgingTracker
//
//  Created by Christian Riboldi on 6/28/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import Foundation

class CRRequirementDescription {
    
    var title: String
    var description: String
    var maxScore: Double
    var uuid: UUID
    
    init(title: String, description: String, maxScore: Double = 10.0, uuid: UUID = UUID()) {
        self.title = title
        self.description = description
        self.maxScore = maxScore
        self.uuid = uuid
    }
    
    init?(jsonDictionary: [String: Any]) {
        
    }
    
}
