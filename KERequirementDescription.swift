//
//  KERequirementDescription.swift
//  BadgingTracker
//
//  Created by Thao Doan on 6/27/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import Foundation

class KERequirementDescription {
    
    var title : String
    var description : String
    var maxScore : Double
    var requirementUUID : UUID
        
    init(title: String,description: String,maxScore: Double,requirementUUID: UUID = UUID()) {
        self.title = title
        self.description = description
        self.maxScore = maxScore
        self.requirementUUID = requirementUUID
      }
}





