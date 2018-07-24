//
//  GithubAuthenticationController.swift
//  BadgingTracker
//
//  Created by Nick Reichard on 7/9/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import Foundation
import Firebase

class GithubAuthenticationController: GithubAuthentication {
    
    // MARK: - Properties
    let credential = GitHubAuthProvider.credential(withToken: "43dd8e040c085fa9182273650d880dbdba9007fa")
    var student: Student?
    let credential2 = GitHubAuthProvider.credential(withToken: GitHubAuthProviderID)
 
    
    func handlGithubAuthentication(email: String, password: String, completionAccount: @escaping (Bool?) -> Void, completion: @escaping (GithubError?, Error?) -> Void) {
        
       
        Auth.auth().signInAndRetrieveData(with: credential2) { (authResult, error) in
            print(self.credential)
            if let error = error {
                print("Error: \(#function) \(error) \(error.localizedDescription)")
                completion(.invalidLogin, error);return
            }
            
            guard let authResult = authResult else { completion(nil, error); return }
            
            print(authResult)
           completionAccount(true)
        }
    }
    
    func handelGitHubAuthentication2() {
        
        

    }
    

}
