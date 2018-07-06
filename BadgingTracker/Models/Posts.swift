//
//  Posts.swift
//  BadgingTracker
//
//  Created by Thao Doan on 6/27/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import Foundation

class Post {
    
    struct Constants {
        static let messageKey: String = "message"
        static let senderKey: String = "sender"
        static let timestampKey: String = "timestamp"
        static let likesKey: String = "likes"
    }
    
    var message: String
    var senderUUID: String
    var sender: Mentor?
    var timestamp: Date
    var likes: Set<String>
    var uuid: UUID
    var id: String {
        return uuid.uuidString
    }
    var dictionaryRepresentation: [String: Any] {
        let dictionary: [String: Any] = [
            Constants.messageKey: self.message,
            Constants.timestampKey: self.timestamp,
            Constants.senderKey: self.senderUUID,
            Constants.likesKey: Array(self.likes).toDictionary(withDefaultValue: true)
        ]
        return dictionary
    }
    var jsonData: Data? {
        return try? JSONSerialization.data(withJSONObject: dictionaryRepresentation, options: .prettyPrinted)
    }
    
    init(message: String, senderUUID: String, timestamp: Date = Date(), likes: Set<String> = Set<String>(), uuid: UUID = UUID()) {
        self.message = message
        self.senderUUID = senderUUID
        self.timestamp = timestamp
        self.likes = likes
        self.uuid = uuid
    }
    
    init?(jsonDictionary: [String: Any], identifier: String) {
        guard let message = jsonDictionary[Constants.messageKey] as? String,
            let timestamp = jsonDictionary[Constants.timestampKey] as? Date,
            let likesDict = jsonDictionary[Constants.likesKey] as? [String:Bool],
            let senderUUID = jsonDictionary[Constants.senderKey] as? String,
            let uuid = UUID(uuidString: identifier) else {
                return nil
        }
        self.senderUUID = senderUUID
        self.message = message
        self.timestamp = timestamp
        self.likes = Set<String>(likesDict.keys)
        self.uuid = uuid
    }
}

