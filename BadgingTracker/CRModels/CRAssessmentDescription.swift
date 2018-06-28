//
//  CRAssessmentDescription.swift
//  BadgingTracker
//
//  Created by Christian Riboldi on 6/28/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import Foundation

class CRAssessmentDescription {
    
    var title: String
    var description: String
    var requiredPassingPercent: Double
    var requirementDescriptions: [CRRequirementDescription]
    var uuid: UUID
    
    init(title: String, description: String, requiredPassingPercent: Double = 80.0, requirementDescriptions: [CRRequirementDescription] = [CRRequirementDescription](), uuid: UUID = UUID()) {
        self.title = title
        self.description = description
        self.requiredPassingPercent = requiredPassingPercent
        self.requirementDescriptions = requirementDescriptions
        self.uuid = uuid
    }
    
    init?(jsonDictionary: [String: Any]) {
        
    }
    
}
