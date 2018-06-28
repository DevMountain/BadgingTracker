//
//  CRAssessment.swift
//  BadgingTracker
//
//  Created by Christian Riboldi on 6/28/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import Foundation

class CRAssessment {
    
    var hasBadge: Bool
    var requirements: [CRRequirement]
    var assessmentDescription: CRAssessmentDescription
    var uuid: UUID
    
    init(requirements: [CRRequirement], assessmentDescription: CRAssessmentDescription, hasBadge: Bool = false, uuid: UUID = UUID()) {
        self.hasBadge = hasBadge
        self.requirements = requirements
        self.assessmentDescription = assessmentDescription
        self.uuid = uuid
    }
    
    init?(jsonDictionary: [String: Any]) {
        
    }
    
}
