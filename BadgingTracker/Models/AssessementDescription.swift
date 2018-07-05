//
//  AssessmentDescription.swift
//  BadgingTracker
//
//  Created by Thao Doan on 6/27/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import Foundation

class AssessmentDescription {
    
    struct Constants {
        static let titleKey: String = "title"
        static let descriptionKey: String = "description"
        static let requiredPassingPercentKey: String = "requiredPassingPercent"
        static let requirementDescriptionsKey: String = "requirementDescriptions"
    }
    
    var title: String
    var description: String
    var requiredPassingPercent: Double
    var requirementDescriptionUUIDs: [String]
    var requirementDescriptions: [RequirementDescription]?
    var uuid: UUID
    var id: String {
        return uuid.uuidString
    }
    var dictionaryRepresentation: [String: Any] {
        let dictionary: [String: Any] = [
            Constants.titleKey: self.title,
            Constants.descriptionKey: self.description,
            Constants.requiredPassingPercentKey: self.requiredPassingPercent,
            Constants.requirementDescriptionsKey: self.requirementDescriptionUUIDs.toDictionary(withDefaultValue: true)
        ]
        return dictionary
    }
    var jsonData: Data? {
        return try? JSONSerialization.data(withJSONObject: dictionaryRepresentation, options: .prettyPrinted)
    }
    
    init(title: String, description: String, requiredPassingPercent: Double = 80.0, requirementDescriptionUUIDs: [String] = [String](), uuid: UUID = UUID()) {
        self.title = title
        self.description = description
        self.requiredPassingPercent = requiredPassingPercent
        self.requirementDescriptionUUIDs = requirementDescriptionUUIDs
        self.uuid = uuid
    }
    
    init?(jsonDictionary: [String: Any], identifier: String) {
        guard let title = jsonDictionary[Constants.titleKey] as? String,
            let description = jsonDictionary[Constants.descriptionKey] as? String,
            let requiredPassingPercent = jsonDictionary[Constants.requiredPassingPercentKey] as? Double,
            let uuid = UUID(uuidString: identifier) else {
                return nil
        }
        guard let requirementDescriptionDictionary = jsonDictionary[Constants.requirementDescriptionsKey] as? [String:Bool] else {
            return nil
        }
        self.requirementDescriptionUUIDs = Array(requirementDescriptionDictionary.keys)
        self.title = title
        self.description = description
        self.requiredPassingPercent = requiredPassingPercent
        self.uuid = uuid
    }
}

