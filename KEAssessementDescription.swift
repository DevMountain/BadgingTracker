//
//  KEAssessementDescription.swift
//  BadgingTracker
//
//  Created by Thao Doan on 6/27/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import Foundation

class KEAssesmentDescription {
    var title : String
    var requirements: [KERequirementDescription]
    var description : String
    var requiredPassingPercentage : Double
    var assessmentUUID: UUID
    var maxScore : Double = {
        var num = 0.0
        return num
    }()
    init?(title: String,requirements: [KERequirementDescription],description : String, requiredPassingPercentage: Double, assessmentUUID : UUID = UUID()) {
        self.title = title
        self.requirements = requirements
        self.description = description
        self.requiredPassingPercentage = requiredPassingPercentage
        self.assessmentUUID = assessmentUUID
    }
}

