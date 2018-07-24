//
//  OAuthHelper.swift
//  BadgingTracker
//
//  Created by Nick Reichard on 7/24/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import Foundation
import SafariServices

class OAuthHelper {
    
    private let clientID: String
    private let clientSecret: String
    private let scopes: [String]
    private var session: SFAuthenticationSession?
    
    init(clientID: String, clientSecret: String, scopes: [String]) {
        self.clientID = clientID
        self.clientSecret = clientSecret
        self.scopes = scopes
    }
    
    var token: String? {
        set {
            UserDefaults.standard.set(newValue, forKey: "token")
        }
        
        get {
            return UserDefaults.standard.string(forKey: "token")
        }
    }
    
    func beginAuth(completion: @escaping (NetworkResponse<Bool>) -> ()) {
        getTemporaryCode { (code) in
            guard let code = code else {
                completion(.failure(error: .unknown))
                return
            }
            
            self.getAccessToken(code: code, completion: completion)
        }
    }
    
    
    // MARK: - Private
    
    private func getTemporaryCode(completion: @escaping (String?) -> ()) {
        guard let url = codeRequestURL() else {
            fatalError("Unable to create temporary code request URL.")
        }
        
        session = SFAuthenticationSession(url: url, callbackURLScheme: nil) { (url, error) in
            guard let url = url else {
                completion(nil)
                return
            }
            
            let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
            completion(components?.queryItems?.first?.value)
        }
        
        session?.start()
    }
    
    private func getAccessToken(code: String, completion: @escaping (NetworkResponse<Bool>) -> ()) {
        guard let url = tokenRequestURL(code: code) else {
            fatalError("Unable to create token exchange URL.")
        }
        
        NetworkController.shared.performTask(url: url, method: .post, headers: ["Accept": "application/json"]) { (response: NetworkResponse<GithubAuthSuccessResponse>) in
            switch response {
            case let .success(response):
                self.token = response.accessToken
                completion(.success(object: true))
            case let .failure(error):
                completion(.failure(error: error))
            }
        }
    }
    
    private func codeRequestURL() -> URL? {
        let scopesString = scopes.joined(separator: " ")
        return URL(string: "https://github.com/login/oauth/authorize?scope=\(scopesString)&client_id=\(clientID)")
    }
    
    private func tokenRequestURL(code: String) -> URL? {
        return URL(string: "https://github.com/login/oauth/access_token?code=\(code)&client_id=\(clientID)&client_secret=\(clientSecret)")
    }
    
    private struct GithubAuthSuccessResponse: Codable {
        enum CodingKeys: String, CodingKey {
            case accessToken = "access_token"
        }
        
        let accessToken: String
    }
    
    
}
