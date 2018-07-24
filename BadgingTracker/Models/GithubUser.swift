//
//  GithubUser.swift
//  BadgingTracker
//
//  Created by Nick Reichard on 7/24/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import Foundation

struct GithubUser: Decodable {
    
    var name: String?
    var login: String
    
    var displayName: String {
        return name ?? login
    }
    
    enum CodingKeys: String, CodingKey {
        case name, login
    }
}
