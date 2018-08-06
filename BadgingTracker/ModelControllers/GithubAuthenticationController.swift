//
//  GithubAuthenticationController.swift
//  BadgingTracker
//
//  Created by Nick Reichard on 7/9/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import Foundation
import Firebase

class GithubAuthenticationController {
    
    // MARK: - Properties
    let credential = GitHubAuthProvider.credential(withToken: "43dd8e040c085fa9182273650d880dbdba9007fa")
    private let helper: OAuthHelper
    
    init(helper: OAuthHelper) {
        self.helper = helper
    }
    
    func logIn(completion: @escaping (NetworkResponse<Bool>) -> ()) {
        helper.beginAuth { response in
            DispatchQueue.main.async {
                completion(response)
            }
        }
    }
    
    func logOut() {
        helper.token = nil
    }
    
    func fetchUser(completion: @escaping (NetworkResponse<GithubUser>) -> ()) {
        fetchUserInformation { (userResponse) in
            self.fetchRepositories(completion: { (repoResponse) in
                DispatchQueue.main.async {
                    switch (userResponse, repoResponse) {
                    case (.success(var user), .success(let repos)):
                        user.repositories = repos
                        completion(.success(object: user))
                    case let (.failure(error), _):
                        completion(.failure(error: error))
                    case let (_, .failure(error)):
                        completion(.failure(error: error))
                    }
                }
            })
        }
    }
    
    private func fetchUserInformation(completion: @escaping (NetworkResponse<GithubUser>) -> ()) {
        guard let token = helper.token,
            let userEndpoint = URL(string: "https://api.github.com/user?access_token=\(token)") else {
                completion(.failure(error: .unauthorized))
                return
        }
        
        NetworkController.shared.performTask(url: userEndpoint, completion: completion)
    }
    
    private func fetchRepositories(completion: @escaping (NetworkResponse<[Repository]>) -> ()) {
        guard let token = helper.token,
            let reposEndpoint = URL(string: "https://api.github.com/user/repos?access_token=\(token)") else {
                completion(.failure(error: .unauthorized))
                return
        }
        
        NetworkController.shared.performTask(url: reposEndpoint, completion: completion)
    }
}
