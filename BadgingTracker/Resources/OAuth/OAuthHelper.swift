//
//  OAuthHelper.swift
//  BadgingTracker
//
//  Created by Nick Reichard on 7/24/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import Foundation
import SafariServices
import WebKit

class OAuthHelper {
    
    private let clientID: String
    private let clientSecret: String
    private let scopes: [String]
    private var session: SFAuthenticationSession?
    var webView: WKWebView?
    
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
    // 1
    private func getTemporaryCode(completion: @escaping (String?) -> ()) {
        guard let url = codeRequestURL() else {
            fatalError("Unable to create temporary code request URL.")
        }
        
        session = SFAuthenticationSession(url: url, callbackURLScheme: nil) { (url, error) in
            guard let url = url else {
                completion(nil)
                return
            }
            if let error = error {
                print("Error with sf auth \(error) \(error.localizedDescription)")
            }

            let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
            completion(components?.queryItems?.first?.value)
        }
        
        
        
        session?.start()

    }
    
    // 2
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
    
    // 2
    private func codeRequestURL() -> URL? {
        let scopesString = scopes.joined(separator: " ")
        let url = URL(string: "https://github.com/login/oauth/authorize?scope=\(scopesString)&client_id=\(clientID)")
        print("codeRequestURL \(url!)")
        return URL(string: "https://github.com/login/oauth/authorize?scope=\(scopesString)&client_id=\(clientID)")
    }
    
    private func tokenRequestURL(code: String) -> URL? {
        let url = URL(string: "https://github.com/login/oauth/access_token?code=\(code)&client_id=\(clientID)&client_secret=\(clientSecret)")
        print("tokenRequestURL \(url!)")
        return URL(string: "https://github.com/login/oauth/access_token?code=\(code)&client_id=\(clientID)&client_secret=\(clientSecret)")
    }
    
    private struct GithubAuthSuccessResponse: Codable {
        enum CodingKeys: String, CodingKey {
            case accessToken = "access_token"
        }
        
        let accessToken: String
    }
    //https://github.com/login/oauth/access_token?code=6dd174ff4b19ec9bdf34&client_id=e4bd6b195e14f86049b0&client_secret=168c2dec9bb3ad8b2f887cedfd016065b980b3e0
    
    
    //https://github.com/login/oauth/access_token?code=read:user&client_id=f12aef8c339d10b287d7&client_secret=3a010d2a4d800d6260edcc2aa73b340f1872b381
    
    // 66ac68a668cecef319319d68cd9e8ef898ec29f1&scope=read
    
    //https://github.com/login/oauth/access_token?code=66ac68a668cecef319319d68cd9e8ef898ec29f1&client_id=f12aef8c339d10b287d7&client_secret=3a010d2a4d800d6260edcc2aa73b340f1872b381
    
    // 9528f379cf919e12188bfa676a341b57d46507b1&scope=read
    
    
    //https://github.com/login/oauth/authorize?scope=read:user&client_id=e4bd6b195e14f86049b0
    //https://github.com/login/oauth/authorize?scope=read:user&client_id=f12aef8c339d10b287d7
}
