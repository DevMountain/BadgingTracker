//
//  CRPost.swift
//  BadgingTracker
//
//  Created by Christian Riboldi on 6/28/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import Foundation

class CRPost {
    
    var message: String
    var sender: CRMentor
    var timestamp: Date
    var likes: Set<String>
    var uuid: UUID
    
    init(message: String, sender: CRMentor, timestamp: Date = Date(), likes: Set<String> = Set<String>(), uuid: UUID = UUID()) {
        self.message = message
        self.sender = sender
        self.timestamp = timestamp
        self.likes = likes
        self.uuid = uuid
    }
    
    init?(jsonDictionary: [String: Any]) {
        
    }
}
