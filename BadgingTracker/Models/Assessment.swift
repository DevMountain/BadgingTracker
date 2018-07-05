//
//  Assessment.swift
//  BadgingTracker
//
//  Created by Thao Doan on 6/27/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import Foundation

class Assessment {
    
    struct Constants {
        static let hasBadgeKey: String = "hasBadge"
        static let requirementsKey: String = "requirements"
        static let assessmentDescriptionKey: String = "assessmentDescription"
    }
    
    var hasBadge: Bool = false
    var requirementUUIDs: [String]
    var requirements: [Requirement]?
    var assessmentDescriptionUUID: String
    var assessmentDescription: AssessmentDescription?
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
        let dictionary: [String: Any] = [
            Constants.hasBadgeKey: self.hasBadge,
            Constants.requirementsKey: self.requirementUUIDs.toDictionary(withDefaultValue: true),
            Constants.assessmentDescriptionKey: self.assessmentDescriptionUUID
        ]
        return dictionary
    }
    var jsonData: Data? {
        return try? JSONSerialization.data(withJSONObject: dictionaryRepresentation, options: .prettyPrinted)
    }
    
    init(hasBadge: Bool, requirementUUIDs: [String], assessmentDescriptionUUID: String, uuid: UUID = UUID()) {
        self.hasBadge = hasBadge
        self.requirementUUIDs = requirementUUIDs
        self.assessmentDescriptionUUID = assessmentDescriptionUUID
        self.uuid = uuid
    }
    
    init?(jsonDictionary: [String: Any], identifier: String) {
        guard let hasBadge = jsonDictionary[Constants.hasBadgeKey] as? Bool, let assessmentDescriptionUUID = jsonDictionary[Constants.assessmentDescriptionKey] as? String,
            let uuid = UUID(uuidString: identifier) else {
                return nil
        }
        guard let requirements = jsonDictionary[Constants.requirementsKey] as? [String: Bool] else {
            return nil
        }
        self.assessmentDescriptionUUID = assessmentDescriptionUUID
        self.requirementUUIDs = Array(requirements.keys)
        self.hasBadge = hasBadge
        self.uuid = uuid
    }
    
}

