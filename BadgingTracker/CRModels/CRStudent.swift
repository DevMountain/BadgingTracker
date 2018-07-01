//
//  CRStudent.swift
//  BadgingTracker
//
//  Created by Christian Riboldi on 6/28/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import Foundation

typealias StudentID = String

class CRStudent {
    
    struct Constants {
        static let nameKey: String = "name"
        static let titleKey: String = "title"
        static let descriptionKey: String = "description"
        static let phoneKey: String = "phone"
        static let emailKey: String = "email"
        static let locationKey: String = "location"
        static let graduationDateKey: String = "graduationDate"
        static let photoKey: String = "photo"
        static let linksKey: String = "links"
        static let isPrivateKey: String = "isPrivate"
        static let currentClassesKey: String = "currentClasses"
        static let previousClassesKey: String = "previousClasses"
    }
    
    var name: String
    var title: String
    var description: String
    var phone: String
    var email: String
    var location: String
    var graduationDate: Date
    var photo: URL?
    var links: [URL]?
    var isPrivate: Bool = false
    var currentClasses: [CRClass]?
    var previousClasses: [CRClass]?
    var uuid: UUID
    var id: StudentID {
        return uuid.uuidString
    }
    var dictionaryRepresentation: [String: Any] {
        var dictionary: [String: Any] = [
            Constants.nameKey: self.name,
            Constants.titleKey: self.title,
            Constants.descriptionKey: self.description,
            Constants.phoneKey: self.phone,
            Constants.emailKey: self.email,
            Constants.locationKey: self.location,
            Constants.graduationDateKey: self.graduationDate,
            Constants.isPrivateKey: self.isPrivate
        ]
        if let photo = self.photo {
            dictionary[Constants.photoKey] = photo
        }
        if let links = self.links {
            dictionary[Constants.linksKey] = links.compactMap { $0.absoluteString }
        }
        if let currentClasses = self.currentClasses {
            dictionary[Constants.currentClassesKey] = currentClasses.compactMap { $0.id }.toDictionary(withDefaultValue: true)
        }
        if let previousClasses = self.previousClasses {
            dictionary[Constants.previousClassesKey] = previousClasses.compactMap { $0.id }.toDictionary(withDefaultValue: true)
        }
        return dictionary
    }
    var jsonData: Data? {
        return try? JSONSerialization.data(withJSONObject: dictionaryRepresentation, options: .prettyPrinted)
    }
    
    init(name: String, title: String, description: String, phone: String, email: String, location: String, photo: URL?, links: [URL]?, graduationDate: Date = Date(), currentClasses: [CRClass]?, previousClasses: [CRClass]?, uuid: UUID = UUID()) {
        self.name = name
        self.title = title
        self.description = description
        self.phone = phone
        self.email = email
        self.location = location
        self.graduationDate = graduationDate
        self.photo = photo
        self.links = links
        self.currentClasses = currentClasses
        self.previousClasses = previousClasses
        self.uuid = uuid
    }
    
    init?(jsonDictionary: [String: Any], identifier: String) {
        guard let name = jsonDictionary[Constants.nameKey] as? String,
            let title = jsonDictionary[Constants.titleKey] as? String,
            let description = jsonDictionary[Constants.descriptionKey] as? String,
            let phone = jsonDictionary[Constants.phoneKey] as? String,
            let email = jsonDictionary[Constants.emailKey] as? String,
            let location = jsonDictionary[Constants.locationKey] as? String,
            let graduationDate = jsonDictionary[Constants.graduationDateKey] as? Date,
            let isPrivate = jsonDictionary[Constants.isPrivateKey] as? Bool,
            let uuid = UUID(uuidString: identifier) else {
                return nil
        }
        self.name = name
        self.title = title
        self.description = description
        self.phone = phone
        self.email = email
        self.location = location
        self.graduationDate = graduationDate
        self.isPrivate = isPrivate
        self.uuid = uuid
        
        if let photoString = jsonDictionary[Constants.photoKey] as? String, let photoURL = URL(string: photoString) {
            self.photo = photoURL
        }
        if let linksArray = jsonDictionary[Constants.linksKey] as? [String] {
            self.links = linksArray.compactMap { URL(string: $0) }
        }
        if let currentClassUUIDs = jsonDictionary[Constants.currentClassesKey] as? [String:Bool] {
            //      Get the current class from the database using this current class.
            //            self.currentClass = currentClass
        }
        if let previousClassUUIDs = jsonDictionary[Constants.previousClassesKey] as? [String:Bool] {
            //      Get the previous classes from the database using this current class.
            //            self.previousClasses = previousClasses
        }
    }
}



