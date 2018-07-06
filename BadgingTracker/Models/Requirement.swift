//
//  Requirement.swift
//  BadgingTracker
//
//  Created by Thao Doan on 6/27/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import Foundation
class Requirement {
    
    struct Constants {
        static let scoreKey: String = "score"
        static let requirementDescriptionKey: String = "requirementDescription"
    }
    
    var score: Double
    var requirementDescriptionUUID: String
    var requirementDescription: RequirementDescription?
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
    var dictionaryRepresentation: [String: Any] {
        let dictionary: [String: Any] = [
            Constants.scoreKey: self.score,
            Constants.requirementDescriptionKey: self.requirementDescriptionUUID
        ]
        return dictionary
    }
    var jsonData: Data? {
        return try? JSONSerialization.data(withJSONObject: dictionaryRepresentation, options: .prettyPrinted)
    }
    
    init(score: Double = 0, requirementDescriptionUUID: String, uuid: UUID = UUID()) {
        self.requirementDescriptionUUID = requirementDescriptionUUID
        self.score = score
        self.uuid = uuid
    }
    
    init?(jsonDictionary: [String: Any], identifier: String) {
        guard let score = jsonDictionary[Constants.scoreKey] as? Double, let requirementDescriptionUUID = jsonDictionary[Constants.requirementDescriptionKey] as? String,
            let uuid = UUID(uuidString: identifier) else {
            return nil
        }
        self.requirementDescriptionUUID = requirementDescriptionUUID
        self.score = score
        self.uuid = uuid
    }
}
