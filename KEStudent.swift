//
//  KEStudent.swift
//  BadgingTracker
//
//  Created by Thao Doan on 6/26/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import UIKit
class KEStudent {
    
    struct Constants {
    static let userTopLevelDataKey = "users"
    static let nameKey = "name"
    static let profilePhotoKey = "photo"
    static let titleKey = "title"
    static let contactLinkKey = "links"
    static let studentDescriptionKey = "description"
    static let currentLocationKey = ""
    static let isPrivateKey = "isPrivate"
    static let graduationDate = "graduationDate"
    static let emailKey = "email"
    static let phoneKey = "phone"
    static let previousClassKey = "previousClass"
    static let currentClassKey = "currentClass"
    static let isMentorKey = "isMentor"
    static let isInstructorKey = "isInstructor"
    static let currentTeachingClass = "currentClasses"
    }
    
    var name : String
    var profilePhoto: String
    var title :  String
    var contactLink : [String]
    var studentDescription: String
    var currentLocation : String
    var isPrivate : Bool
    var graduationDate : Date
    var email: String
    var phone: Int
    var previousClass : [String]
    var currentClass : [String]
    var isMentor : Bool = false
    var isInstructor : Bool = false
    var userUuid : UUID

    init(name: String, profilePhoto: String, title: String,contactLink: [String] = [String](),studentDescription: String,currentLocation: String,isPrivate: Bool = false,graduationDate: Date = Date(),email: String = String(), phone:Int = Int(),previousClass : [String] = [String](),currentClass : [String] = [String](),userUuid: UUID = UUID()) {
        //MentorUUID, leadInstructorUUID ???
        self.name = name
        self.profilePhoto = profilePhoto
        self.title = title
        self.contactLink = contactLink
        self.studentDescription = studentDescription
        self.currentLocation = currentLocation
        self.isPrivate = isPrivate
        self.graduationDate = graduationDate
        self.email = email
        self.phone = phone
        self.previousClass = previousClass
        self.currentClass = currentClass
        self.userUuid = userUuid
       
    }
    init?(jsonDictionary: [String: Any],userUuid: String) {
        guard let name = jsonDictionary[Constants.nameKey] as? String,
              let photo = jsonDictionary[Constants.profilePhotoKey] as? String,
              let title = jsonDictionary[Constants.contactLinkKey] as? String,
              let contactLink = jsonDictionary[Constants.contactLinkKey] as? String,
              let currentLocation = jsonDictionary[Constants.currentLocationKey] as? String,
              let isPrivate = jsonDictionary[Constants.isPrivateKey] as? Bool,
              let graduationDate  = jsonDictionary[Constants.graduationDate] as? Date,
              let email = jsonDictionary[Constants.emailKey] as? String,
              let currentClass = jsonDictionary[Constants.currentClassKey] as? String,
              let isMentor = jsonDictionary[Constants.isMentorKey] as? Bool,
              let isInstructor = jsonDictionary[Constants.isInstructorKey] as? Bool,
              let userUUID  = UUID(uuidString: userUuid)
              else {return nil }
              let phone = jsonDictionary[Constants.phoneKey] as? Int ?? 0
              let previousClass = jsonDictionary[Constants.previousClassKey] as? String ?? ""
              let studentDescription = jsonDictionary[Constants.studentDescriptionKey] as? String ?? ""
        
        self.name = name
        self.profilePhoto = photo
        self.title = title
        self.contactLink = [contactLink]
        self.studentDescription = studentDescription
        self.currentLocation = currentLocation
        self.isPrivate = isPrivate
        self.graduationDate = graduationDate
        self.email = email
        self.phone = phone
        self.previousClass = [previousClass]
        self.currentClass = [currentClass]
        self.currentLocation = currentLocation
        self.isMentor = isMentor
        self.isInstructor = isInstructor
        self.userUuid = userUUID
}

}
