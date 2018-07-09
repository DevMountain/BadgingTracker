//
//  ErrorHandeling.swift
//  BadgingTracker
//
//  Created by Nick Reichard on 7/9/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import Foundation

enum GithubError: Error {
    case networkAuthError
    case userNotFound
    case invalidLogin, badAuthReesult
    
    
}
