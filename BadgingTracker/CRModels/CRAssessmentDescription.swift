//
//  CRAssessmentDescription.swift
//  BadgingTracker
//
//  Created by Christian Riboldi on 6/28/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import Foundation

class CRAssessmentDescription {
    
    struct Constants {
        static let titleKey: String = "title"
        static let descriptionKey: String = "description"
        static let requiredPassingPercentKey: String = "requiredPassingPercent"
        static let requirementDescriptionsKey: String = "requirementDescriptions"
    }
    
    var title: String
    var description: String
    var requiredPassingPercent: Double
    var requirementDescriptions: [CRRequirementDescription]?
    var uuid: UUID
    var id: String {
        return uuid.uuidString
    }
    var dictionaryRepresentation: [String: Any] {
        var dictionary: [String: Any] = [
            Constants.titleKey: self.title,
            Constants.descriptionKey: self.description,
            Constants.requiredPassingPercentKey: self.requiredPassingPercent
        ]
        if let requirementDescriptions = self.requirementDescriptions {
            dictionary[Constants.requirementDescriptionsKey] = requirementDescriptions.compactMap { $0.id }.toDictionary(withDefaultValue: true)
        }
        return dictionary
    }
    var jsonData: Data? {
        return try? JSONSerialization.data(withJSONObject: dictionaryRepresentation, options: .prettyPrinted)
    }
    
    init(title: String, description: String, requiredPassingPercent: Double = 80.0, requirementDescriptions: [CRRequirementDescription] = [CRRequirementDescription](), uuid: UUID = UUID()) {
        self.title = title
        self.description = description
        self.requiredPassingPercent = requiredPassingPercent
        self.requirementDescriptions = requirementDescriptions
        self.uuid = uuid
    }
    
    init?(jsonDictionary: [String: Any], identifier: String) {
        guard let title = jsonDictionary[Constants.titleKey] as? String,
            let description = jsonDictionary[Constants.descriptionKey] as? String,
            let requiredPassingPercent = jsonDictionary[Constants.requiredPassingPercentKey] as? Double,
            let uuid = UUID(uuidString: identifier) else {
            return nil
        }
        self.title = title
        self.description = description
        self.requiredPassingPercent = requiredPassingPercent
        self.uuid = uuid
        
        if let requirementDescriptions = jsonDictionary[Constants.requirementDescriptionsKey] as? [String:Bool] {
            // Get the requirementDescriptions from firebase
        }
    }
    
}
