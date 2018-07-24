//
//  GithubDependency.swift
//  BadgingTracker
//
//  Created by Nick Reichard on 7/9/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import Foundation

protocol GithubAuthentication: class {
    func handlGithubAuthentication(email: String, password: String, completionAccount: @escaping (Bool?) -> Void, completion: @escaping (GithubError?, Error?) -> Void)
    
}

