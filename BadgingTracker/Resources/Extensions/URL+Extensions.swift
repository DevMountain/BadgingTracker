//
//  URL+Extensions.swift
//  BadgingTracker
//
//  Created by Nick Reichard on 7/23/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import Foundation

extension URL {
    
    func urlByAdding(parameters: [String: String]?, to url: URL) -> URL {
        var compoentns = URLComponents(url: url, resolvingAgainstBaseURL: true)
        compoentns?.queryItems = parameters?.compactMap{URLQueryItem(name: $0.0, value: $0.1)}
        
        guard let url = compoentns?.url else {
            fatalError("URL optional is nil")
        }
    
        return url
    }
}
