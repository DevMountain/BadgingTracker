//
//  CRRequirement.swift
//  BadgingTracker
//
//  Created by Christian Riboldi on 6/28/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import Foundation

class CRRequirement {
    
    struct Constants {
        static let scoreKey: String = "score"
        static let requirementDescriptionKey: String = "requirementDescription"
    }
    
    var score: Double
    var requirementDescription: CRRequirementDescription?
    var uuid: UUID
    var id: String {
        return uuid.uuidString
    }
    var title: String {
        return requirementDescription?.title ?? "(no title)"
    }
    var description: String {
        return requirementDescription?.description ?? "(no description)"
    }
    var maxScore: Double {
        return requirementDescription?.maxScore ?? 0.0
    }
    
    init(requirementDescription: CRRequirementDescription, score: Double = 0, uuid: UUID = UUID()) {
        self.requirementDescription = requirementDescription
        self.score = score
        self.uuid = uuid
    }
    
    init?(jsonDictionary: [String: Any], identifier: String) {
        guard let score = jsonDictionary[Constants.scoreKey] as? Double,
            let uuid = UUID(uuidString: identifier) else {
                return nil
        }
        self.score = score
        self.uuid = uuid
        
        if let requirementDescription = jsonDictionary[Constants.requirementDescriptionKey] as? String {
            // Get the requirementDescription from firebase
        }
    }
    
}
