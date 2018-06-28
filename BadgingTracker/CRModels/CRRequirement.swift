//
//  CRRequirement.swift
//  BadgingTracker
//
//  Created by Christian Riboldi on 6/28/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import Foundation

class CRRequirement {
    
    var score: Double
    var requirementDescription: CRRequirementDescription
    var uuid: UUID
    var title: String {
        return requirementDescription.title
    }
    var description: String {
        return requirementDescription.description
    }
    var maxScore: Double {
        return requirementDescription.maxScore
    }
    
    init(requirementDescription: CRRequirementDescription, score: Double = 0, uuid: UUID = UUID()) {
        self.requirementDescription = requirementDescription
        self.score = score
        self.uuid = uuid
    }
    
    init?(jsonDictionary: [String: Any]) {
        
    }
    
}
