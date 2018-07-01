//
//  KELeadIntructor.swift
//  BadgingTracker
//
//  Created by Thao Doan on 6/27/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import UIKit

class KELeadIntructor: KEStudent {
    
    init(name: String, profilePhoto: String, title: String, contactLink: [String], studentDescription: String, currentLocation: String, isPrivate: Bool, graduationDate: Date, email: String, phone: Int, previousClass: [String] , currentClass: [String] , userUuid: UUID , isLeadInstructor: Bool = true) {
        super.init(name: name, profilePhoto: profilePhoto, title: title, contactLink: contactLink, studentDescription: studentDescription, currentLocation: currentLocation, isPrivate: isPrivate, graduationDate: graduationDate, email: email, phone: phone, previousClass: previousClass, currentClass: currentClass, userUuid: userUuid)
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
        self.isInstructor = isLeadInstructor
        
    }
   
}
