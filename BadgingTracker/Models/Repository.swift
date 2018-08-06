//
//  Repository.swift
//  BadgingTracker
//
//  Created by Nick Reichard on 8/2/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import Foundation

struct Repository: Codable {
    var name: String
    var url: URL
    
    enum CodingKeys: String, CodingKey {
        case name
        case url = "html_url"
    }
}
