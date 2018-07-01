//
//  CRAssessment.swift
//  BadgingTracker
//
//  Created by Christian Riboldi on 6/28/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import Foundation

class CRAssessment {
    
    struct Constants {
        static let hasBadgeKey: String = "hasBadge"
        static let requirementsKey: String = "requirements"
        static let assessmentDescriptionKey: String = "assessmentDescription"
    }
    
    var hasBadge: Bool
    var requirements: [CRRequirement]?
    var assessmentDescription: CRAssessmentDescription?
    var uuid: UUID
    var id: String {
        return uuid.uuidString
    }
    var title: String {
        return assessmentDescription?.title ?? "(no title)"
    }
    var description: String {
        return assessmentDescription?.description ?? "(no description)"
    }
    var dictionaryRepresentation: [String: Any] {
        var dictionary: [String: Any] = [Constants.hasBadgeKey: self.hasBadge]
        if let requirements = self.requirements {
            dictionary[Constants.requirementsKey] = requirements.compactMap { $0.id }.toDictionary(withDefaultValue: true)
        }
        if let assessmentDescription = self.assessmentDescription {
            dictionary[Constants.assessmentDescriptionKey] = assessmentDescription.id
        }
        return dictionary
    }
    var jsonData: Data? {
        return try? JSONSerialization.data(withJSONObject: dictionaryRepresentation, options: .prettyPrinted)
    }
    
    init(requirements: [CRRequirement], assessmentDescription: CRAssessmentDescription, hasBadge: Bool = false, uuid: UUID = UUID()) {
        self.hasBadge = hasBadge
        self.requirements = requirements
        self.assessmentDescription = assessmentDescription
        self.uuid = uuid
    }
    
    init?(jsonDictionary: [String: Any], identifier: String) {
        guard let hasBadge = jsonDictionary[Constants.hasBadgeKey] as? Bool,
            let uuid = UUID(uuidString: identifier) else {
                return nil
        }
        self.hasBadge = hasBadge
        self.uuid = uuid
        
        if let requirements = jsonDictionary[Constants.requirementsKey] as? [String:Bool] {
            // Get the requirements from firebase
        }
        if let assessmentDescription = jsonDictionary[Constants.assessmentDescriptionKey] as? String {
            // Get the assessmentDescription from firebase
        }
    }
    
}
