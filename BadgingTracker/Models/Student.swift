//
//  Student.swift
//  BadgingTracker
//
//  Created by Thao Doan on 6/26/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import UIKit

typealias StudentID = String
typealias User = Student

class Student {
    
    struct Constants {
        static let nameKey = "name"
        static let profilePhotoKey = "photo"
        static let titleKey = "title"
        static let contactLinkKey = "links"
        static let descriptionKey = "description"
        static let currentLocationKey = "location"
        static let isPrivateKey = "isPrivate"
        static let graduationDateKey = "graduationDate"
        static let emailKey = "email"
        static let phoneKey = "phone"
        static let currentClassesKey = "currentClasses"
        static let previousClassesKey = "previousClasses"
    }
    
    var name: String
    var title:  String
    var description: String
    var phone: String? = nil
    var email: String
    var currentLocation: String
    var graduationDate: Date
    var hasGraduated: Bool
    var profilePhoto: String
    var profilePhotoImage: UIImage = UIImage(named: "profile_empty_large")!
    var contactLinks: [String]?
    var isPrivate: Bool = false
    var currentClassUUIDs: [String]
    var previousClassUUIDs: [String]
    var currentClasses: [Class]?
    var mostRecentClass: String {
        return "iOS Development"
    }
    var hasBadged: Bool
    var previousClasses: [Class]?
    var userUuid: String
    var id: StudentID {
        return self.userUuid
    }
    var dictionaryRepresentation: [String: Any?] {
        let dictionary: [String: Any?] = [
            Constants.nameKey: self.name,
            Constants.titleKey: self.title,
            Constants.descriptionKey: self.description,
            Constants.phoneKey: self.phone ?? nil,
            Constants.emailKey: self.email,
            Constants.currentLocationKey: self.currentLocation,
            Constants.graduationDateKey: self.graduationDate,
            Constants.profilePhotoKey: self.profilePhoto,
            Constants.isPrivateKey: self.isPrivate,
            Constants.contactLinkKey: self.contactLinks ?? nil,
            Constants.currentClassesKey: self.currentClassUUIDs.toDictionary(withDefaultValue: true),
            Constants.previousClassesKey: self.previousClassUUIDs.toDictionary(withDefaultValue: true)
        ]
        return dictionary
    }
    var jsonData: Data? {
        return try? JSONSerialization.data(withJSONObject: dictionaryRepresentation, options: .prettyPrinted)
    }
    
    init(name: String,
         title: String,
         description: String,
         phone: String,
         email: String,
         currentLocation: String,
         profilePhoto: String,
         contactLink: [String]? = nil,
         graduationDate: Date = Date(),
         previousClass: [String] = [String](),
         currentClass: [String] = [String](),
         userUuid: String, hasBadged: Bool, hasGraduated: Bool = false) {
        
        self.name = name
        self.profilePhoto = profilePhoto
        if let profileImage = UIImage(named: profilePhoto) {
            self.profilePhotoImage = profileImage
        }
        self.title = title
        self.contactLinks = contactLink
        self.description = description
        self.currentLocation = currentLocation
        self.graduationDate = graduationDate
        self.email = email
        self.phone = phone
        self.previousClassUUIDs = previousClass
        self.currentClassUUIDs = currentClass
        self.userUuid = userUuid
        self.hasBadged = hasBadged
        self.hasGraduated = hasGraduated
    }
    
    init?(jsonDictionary: [String: Any], uuidString: String) {
        guard let name = jsonDictionary[Constants.nameKey] as? String,
            let photo = jsonDictionary[Constants.profilePhotoKey] as? String,
            let title = jsonDictionary[Constants.contactLinkKey] as? String,
            let currentLocation = jsonDictionary[Constants.currentLocationKey] as? String,
            let isPrivate = jsonDictionary[Constants.isPrivateKey] as? Bool,
            let studentDescription = jsonDictionary[Constants.descriptionKey] as? String,
            let graduationDate  = jsonDictionary[Constants.graduationDateKey] as? Double,
            let email = jsonDictionary[Constants.emailKey] as? String,
            let previousClassUUIDs = jsonDictionary[Constants.previousClassesKey] as? [String],
            let currentClassUUIDs = jsonDictionary[Constants.currentClassesKey] as? [String] else {
                return nil
        }
        let phone = jsonDictionary[Constants.phoneKey] as? String ?? nil
        let contactLinks = jsonDictionary[Constants.contactLinkKey] as? [String] ?? nil
        
        self.name = name
        self.title = title
        self.description = studentDescription
        self.email = email
        self.phone = phone
        self.profilePhoto = photo
        self.currentLocation = currentLocation
        self.graduationDate = Date(timeIntervalSince1970: graduationDate)
        self.contactLinks = contactLinks
        self.isPrivate = isPrivate
        self.currentClassUUIDs = currentClassUUIDs
        self.previousClassUUIDs = previousClassUUIDs
        self.userUuid = uuidString
        self.hasBadged = false
        self.hasGraduated = false
    }
}
