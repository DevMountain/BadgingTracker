//
//  TestViewController.swift
//  BadgingTracker
//
//  Created by Nick Reichard on 7/25/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import UIKit
import WebKit

class TestViewController: UIViewController, WKNavigationDelegate {
    
    var webView: WKWebView!
    var code = String()
    var accessToken = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func sendRequest() {
        /* Configure session, choose between:
         * defaultSessionConfiguration
         * ephemeralSessionConfiguration
         * backgroundSessionConfigurationWithIdentifier:
         And set session-wide properties, such as: HTTPAdditionalHeaders,
         HTTPCookieAcceptPolicy, requestCachePolicy or timeoutIntervalForRequest.
         */
        
        /* Create session, and optionally set a URLSessionDelegate. */
        
        /* Create the Request:
         Request (GET https://github.com/login/oauth/authorize)
         */
        
        guard var URL = URL(string: "https://github.com/login/oauth/authorize") else {return}
        var request = URLRequest(url: URL)
        request.httpMethod = "GET"
        
        // Headers
        
        request.addValue("Bearer ", forHTTPHeaderField: "Authorization")
//        request.addValue("application/json", forHTTPHeaderField: "Accept")
//        request.addValue("token \(accessToken)", forHTTPHeaderField: "Authorization")
      
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            do {
                
                if let error = error { throw error }
                let statusCode = (response as! HTTPURLResponse).statusCode
                print("URL Session Task Succeeded: HTTP \(statusCode)")
                guard let data = data,
                    let responseData = String(data: data, encoding: String.Encoding.utf8) else { return }
                print(responseData)
           
            } catch let error {
                print("Error \(error) \(error.localizedDescription)")
                return
            }
        }.resume()
        
    }
    
    
    func getUser(accessToken: String) {
        let urlString = "https://github.com/login/oauth/access_token"
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("token \(accessToken)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            do {
                if let error = error {
                    print("Error fetching: \(#function) \(error) \(error.localizedDescription)")
                    return
                }
                
                guard let data = data else { throw NSError() }
                
                let content = String(data: data, encoding: .utf8)
                DispatchQueue.main.async {
                    print(content ?? "")
                }
                
            } catch let error {
                print("Error fetching: \(#function) \(error) \(error.localizedDescription)")
                return
            }
            }.resume()
    }
    
    func loadGitHubSignIn() {
        let url = URL(string: "https://github.com/login/oauth/authorize?client_id=f12aef8c339d10b287d7")
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
        webView.load(URLRequest(url: url!))
    }
    @IBAction func textButtonTapped(_ sender: Any) {
        
    }
    
    func getCodeURL(urlString: String) -> String{
        //Replace the callBackurl with empty string to get the code!
        let codeString = urlString.replacingOccurrences(of: "https://badgingtracker-35e08.firebaseapp.com/__/auth/handler?code=", with: "")
        return codeString
    }
    
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        if let url = webView.url {
            guard let code = url.query?.components(separatedBy: "code=").last else { return }
            
            var req = URLRequest(url: url)
            req.httpMethod = "POST"
            req.addValue("application/json", forHTTPHeaderField: "Content-Type")
            req.addValue("application/json", forHTTPHeaderField: "Accept")
            
            
            let params = [
                "client_id" : "f12aef8c339d10b287d7",
                "client_secret" : "3a010d2a4d800d6260edcc2aa73b340f1872b381",
                "code" : code
            ]
            req.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
            URLSession.shared.dataTask(with: req) { (data, response, error) in
                
                do {
                    if let error = error { throw error }
                    
                    
                    guard let data = data else { return }
                    if let _ = response {
                        let responseData = String(data: data, encoding: .utf8)
                        //                        self.getUser(accessToken: responseData ?? "")
                    }
                    
                    
                    guard let content = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else { return }
                    
                    
                    if let accessToken = content["access_token"] as? String {
                        self.getUser(accessToken: accessToken)
                    }
                    
                    
                } catch let error {
                    print("Error fetching: \(#function) \(error) \(error.localizedDescription)")
                    return
                }
                }.resume()
        }
        
    }
    
    func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
        print("WE HAVE BEEN REDIRECTED")
    }
    
    
    func sendRequest2() {
        /* Configure session, choose between:
         * defaultSessionConfiguration
         * ephemeralSessionConfiguration
         * backgroundSessionConfigurationWithIdentifier:
         And set session-wide properties, such as: HTTPAdditionalHeaders,
         HTTPCookieAcceptPolicy, requestCachePolicy or timeoutIntervalForRequest.
         */
        let sessionConfig = URLSessionConfiguration.default
        
        /* Create session, and optionally set a URLSessionDelegate. */
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        
        /* Create the Request:
         Request (GET https://github.com/login/oauth/authorize)
         */
        
        guard var URL = URL(string: "https://github.com/login/oauth/authorize") else {return}
        let URLParams = [
            "client_id": "f12aef8c339d10b287d7",
            ]
        URL = URL.appendingQueryParameters(URLParams)
        var request = URLRequest(url: URL)
        request.httpMethod = "GET"
        
        // Headers
        
        request.addValue("Basic cmVpY2g0NTJAcmVnaXMuZWR1Ok5ld3NjaG9vbGVyczMz", forHTTPHeaderField: "Authorization")
     
        
        /* Start a new Task */
        let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
           
            if let error = error {
                print("Error \(error) \(error.localizedDescription)")
            }
            guard let data = data else { return }
            
            let respnoseString = String(data: data, encoding: .utf8)
            print(respnoseString ?? "")
            
        })
        task.resume()
        session.finishTasksAndInvalidate()
    }
    
 
    
}


protocol URLQueryParameterStringConvertible {
    var queryParameters: String {get}
}

extension Dictionary : URLQueryParameterStringConvertible {
    /**
     This computed property returns a query parameters string from the given NSDictionary. For
     example, if the input is @{@"day":@"Tuesday", @"month":@"January"}, the output
     string will be @"day=Tuesday&month=January".
     @return The computed parameters string.
     */
    var queryParameters: String {
        var parts: [String] = []
        for (key, value) in self {
            let part = String(format: "%@=%@",
                              String(describing: key).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!,
                              String(describing: value).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)
            parts.append(part as String)
        }
        return parts.joined(separator: "&")
    }
    
}

extension URL {
    /**
     Creates a new URL by adding the given query parameters.
     @param parametersDictionary The query parameter dictionary to add.
     @return A new URL.
     */
    func appendingQueryParameters(_ parametersDictionary : Dictionary<String, String>) -> URL {
        let URLString : String = String(format: "%@?%@", self.absoluteString, parametersDictionary.queryParameters)
        return URL(string: URLString)!
    }
}

