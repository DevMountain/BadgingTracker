//
//  RequirementDescription.swift
//  BadgingTracker
//
//  Created by Thao Doan on 6/27/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import Foundation

class RequirementDescription {
    
    struct Constants {
        static let titleKey: String = "title"
        static let descriptionKey: String = "description"
        static let maxScoreKey: String = "maxScore"
    }
    
    var title: String
    var description: String
    var maxScore: Double
    var uuid: UUID
    var id: String {
        return uuid.uuidString
    }
    var dictionaryRepresentation: [String: Any] {
        let dictionary: [String: Any] = [
            Constants.titleKey: self.title,
            Constants.descriptionKey: self.description,
            Constants.maxScoreKey: self.maxScore
        ]
        return dictionary
    }
    var jsonData: Data? {
        return try? JSONSerialization.data(withJSONObject: dictionaryRepresentation, options: .prettyPrinted)
    }
    
    init(title: String, description: String, maxScore: Double = 10.0, uuid: UUID = UUID()) {
        self.title = title
        self.description = description
        self.maxScore = maxScore
        self.uuid = uuid
    }
    
    init?(jsonDictionary: [String: Any], identifier: String) {
        guard let title = jsonDictionary[Constants.titleKey] as? String,
            let description = jsonDictionary[Constants.descriptionKey] as? String,
            let maxScore = jsonDictionary[Constants.maxScoreKey] as? Double,
            let uuid = UUID(uuidString: identifier) else {
                return nil
        }
        self.title = title
        self.description = description
        self.maxScore = maxScore
        self.uuid = uuid
    }
}





