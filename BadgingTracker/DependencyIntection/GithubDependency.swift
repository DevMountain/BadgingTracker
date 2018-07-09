//
//  GithubDependency.swift
//  BadgingTracker
//
//  Created by Nick Reichard on 7/9/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import Foundation

protocol GithubAuthentication: class {
    func handlGithubAuthentication()
}

class GithubDependency {
    
    let gitHubAuth: GithubAuthentication
    
    init(gitHubAuth: GithubAuthentication) {
        self.gitHubAuth = gitHubAuth
    }
    
}
