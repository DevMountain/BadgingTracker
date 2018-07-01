//
//  KERequirement.swift
//  BadgingTracker
//
//  Created by Thao Doan on 6/27/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import Foundation
class KERequirement {
    
    var requirementDescription : KERequirementDescription
    var score: Double = 0
    var title : String
    var description :String
    var maxScore : Double = 0
    
    init(requirementDescription : KERequirementDescription,title : String,description :String,score:Double,maxScore:Double) {
        self.requirementDescription = requirementDescription
        self.title = title
        self.description = description
        self.maxScore = maxScore
        self.score = score
    }
    
//    init?(dictionaty: [String: Any]) {
//        
//    
//    }
}
