//
//  NetworkingController.swift
//  BadgingTracker
//
//  Created by Nick Reichard on 7/24/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import Foundation
import Foundation

class NetworkController {
    
    static let shared = NetworkController()
    
    enum HTTPMethod: String {
        case get = "GET"
        case post = "POST"
    }
    
    func performTask<T>(scheme: String, host: String, path: String, queryItems: [URLQueryItem]?=nil, method: HTTPMethod?=nil, body: Data?=nil, headers: [String: String]?=nil, completion: @escaping (NetworkResponse<T>) -> ()) {
        guard let url = createURL(scheme: scheme, host: host, path: path, queryItems: queryItems) else {
            fatalError("Make this work")
        }
        
        let request = buildURLRequest(url: url, method: method, headers: headers, body: body)
        
        let dataTask = URLSession.shared.dataTask(with: request) {self.dataTaskCompletionHandler(data: $0, response: $1, error: $2, completion: completion)}
        dataTask.resume()
    }
    
    func performTask<T>(url: URL, method: HTTPMethod?=nil, body: Data?=nil, headers: [String: String]?=nil, completion: @escaping (NetworkResponse<T>) -> ()) {
        
        let components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        
        guard let scheme = components?.scheme,
            let host = components?.host,
            let path = components?.path,
            let queryItems = components?.queryItems else {fatalError("Unable to get URL components from provided URL.")}
        
        performTask(scheme: scheme, host: host, path: path, queryItems: queryItems, method: method, body: body, headers: headers, completion: completion)
    }
}

extension NetworkController {
    private func dataTaskCompletionHandler<T>(data: Data?, response: URLResponse?, error: Error?, completion: (NetworkResponse<T>) -> ()) {
        if let httpResponse = response as? HTTPURLResponse,
            let error = self.errorFromResponse(httpResponse) {
            completion(NetworkResponse.failure(error: error))
            return
        }
        
        guard let data = data else {
            completion(NetworkResponse.failure(error: .noDataReturned))
            return
        }
        
        let jsonDecoder = JSONDecoder()
        guard let item = try? jsonDecoder.decode(T.self, from: data) else {
            
            if let dataString = String(data: data, encoding: .utf8) {
                print("Data not decodable: \(dataString)")
            }
            
            completion(NetworkResponse.failure(error: .dataNotDecodable))
            return
        }
        
        completion(NetworkResponse.success(object: item))
    }
    
    private func createURL(scheme: String, host: String, path: String, queryItems: [URLQueryItem]?) -> URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = host
        urlComponents.path = path
        urlComponents.queryItems = queryItems
        
        return urlComponents.url
    }
    
    private func buildURLRequest(url: URL, method: HTTPMethod?=nil, headers: [String: String]?=nil, body: Data?=nil) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method?.rawValue ?? "GET"
        request.httpBody = body
        
        if let headers = headers {
            for (headerName, headerValue) in headers {
                request.setValue(headerValue, forHTTPHeaderField: headerName)
            }
        }
        
        return request
    }
    
    private func errorFromResponse(_ response: HTTPURLResponse) -> GithubError? {
        switch response.statusCode {
        case 500:
            return .internalServerError
        case 442:
            return .incorrectParameters
        case 401:
            return .unauthorized
        case 402:
            return .invalidLogin
        case 403:
            return .unauthorized
        case 200:
            return nil
        default:
            return .unknown
        }
    }
}
