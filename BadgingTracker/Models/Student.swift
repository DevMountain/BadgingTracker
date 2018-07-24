//
//  Student.swift
//  BadgingTracker
//
//  Created by Thao Doan on 6/26/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import UIKit

typealias StudentID = String

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
        static let isMentorKey = "isMentor"
        static let isInstructorKey = "isInstructor"
    }
    
    var name: String
    var title:  String
    var description: String
    var phone: String? = nil
    var email: String
    var currentLocation: String
    var graduationDate: Date
    var profilePhoto: String
    var contactLinks: [String]?
    var isPrivate: Bool = false
    var currentClassUUIDs: [String]
    var previousClassUUIDs: [String]
    var currentClasses: [Class]?
    var previousClasses: [Class]?
    var userUuid: String
    var id: StudentID {
        return self.userUuid
    }
    var dictionaryRepresentation: [String: Any] {
        var dictionary: [String: Any] = [
            Constants.nameKey: self.name,
            Constants.titleKey: self.title,
            Constants.descriptionKey: self.description,
            Constants.emailKey: self.email,
            Constants.currentLocationKey: self.currentLocation,
            Constants.graduationDateKey: self.graduationDate.timeIntervalSince1970,
            Constants.profilePhotoKey: self.profilePhoto,
            Constants.isPrivateKey: self.isPrivate,
            Constants.currentClassesKey: self.currentClassUUIDs.toDictionary(withDefaultValue: true),
            Constants.previousClassesKey: self.previousClassUUIDs.toDictionary(withDefaultValue: true)
        ]
        if let phone = self.phone {
            dictionary[Constants.phoneKey] = phone
        } else {
            dictionary[Constants.phoneKey] = nil
        }
        if let contactLinks = self.contactLinks {
            dictionary[Constants.contactLinkKey] = contactLinks
        } else {
            dictionary[Constants.contactLinkKey] = nil
        }
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
         userUuid: String) {
        
        self.name = name
        self.profilePhoto = profilePhoto
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
    }
}
