//
//  ErrorHandeling.swift
//  BadgingTracker
//
//  Created by Nick Reichard on 7/9/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import Foundation

enum NetworkResponse<T: Decodable> {
    case success(object: T)
    case failure(error: GithubError)
}

enum GithubError: Error {
    case noConnection
    case noDataReturned
    case dataNotDecodable
    case unauthorized
    case unknown
    case internalServerError
    case incorrectParameters
    case invalidLogin, badAuthReesult
}
