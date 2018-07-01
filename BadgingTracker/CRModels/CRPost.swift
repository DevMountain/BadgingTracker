//
//  CRPost.swift
//  BadgingTracker
//
//  Created by Christian Riboldi on 6/28/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import Foundation

class CRPost {
    
    struct Constants {
        static let messageKey: String = "message"
        static let senderKey: String = "sender"
        static let timestampKey: String = "timestamp"
        static let likesKey: String = "likes"
    }
    
    var message: String
    var sender: CRMentor?
    var timestamp: Date
    var likes: Set<String>
    var uuid: UUID
    var id: String {
        return uuid.uuidString
    }
    var dictionaryRepresentation: [String: Any] {
        var dictionary: [String: Any] = [
            Constants.messageKey: self.message,
            Constants.timestampKey: self.timestamp,
            Constants.likesKey: Array(self.likes).toDictionary(withDefaultValue: true)
        ]
        if let sender = self.sender {
            dictionary[Constants.senderKey] = sender.id
        }
        return dictionary
    }
    var jsonData: Data? {
        return try? JSONSerialization.data(withJSONObject: dictionaryRepresentation, options: .prettyPrinted)
    }
    
    init(message: String, sender: CRMentor, timestamp: Date = Date(), likes: Set<String> = Set<String>(), uuid: UUID = UUID()) {
        self.message = message
        self.sender = sender
        self.timestamp = timestamp
        self.likes = likes
        self.uuid = uuid
    }
    
    init?(jsonDictionary: [String: Any], identifier: String) {
        guard let message = jsonDictionary[Constants.messageKey] as? String,
            let timestamp = jsonDictionary[Constants.timestampKey] as? Date,
            let likesDict = jsonDictionary[Constants.likesKey] as? [String:Bool],
            let uuid = UUID(uuidString: identifier) else {
                return nil
        }
        self.message = message
        self.timestamp = timestamp
        self.likes = Set<String>(likesDict.keys)
        self.uuid = uuid
        
        if let senderID = jsonDictionary[Constants.senderKey] as? String {
            // Get the sender from firebase
        }
    }
}
