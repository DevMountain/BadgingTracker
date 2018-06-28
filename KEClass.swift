//
//  KEClass.swift
//  BadgingTracker
//
//  Created by Thao Doan on 6/27/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import UIKit

class KEClass {
    struct Constants {
        static let classDictionaryKey = "classes"
        static let titleKey = "title"
        static let locationKey = "location"
        static let cohortIDKey = "cohortID"
        static let mentorKey = "mentor"
        static let studentsKey = "students"
        static let leadInstructorKey = "leadInstructor"
    }
    var title : String
    var location : String
    var cohortID : String
    var students : KEAssesmentDescription
    var mentor : [KEMentor]
    var leadInstructor  : KELeadIntructor
    var classUUID : UUID

    init(title: String,location: String, cohortID: String, students: KEAssesmentDescription,mentor: KEMentor, leadInstructor :KELeadIntructor, classUUID: UUID ) {
        self.title = title
        self.location = location
        self.cohortID = cohortID
        self.students = students
        self.mentor = [mentor]
        self.leadInstructor = leadInstructor
        self.classUUID = classUUID
    }
    
    init?(dictionary: [String: Any],classUUID:String ) {
    guard let title = dictionary[Constants.titleKey] as? String,
          let location = dictionary[Constants.locationKey] as? String,
          let cohortID = dictionary[Constants.cohortIDKey] as? String,
          let student = dictionary[Constants.studentsKey] as?  KEAssesmentDescription,
          let mentor = dictionary[Constants.mentorKey] as? KEMentor,
          let leadInstructor = dictionary[Constants.leadInstructorKey] as? KELeadIntructor,
          let classUUID = dictionary[classUUID] as? UUID else {return nil}

        self.title = title
        self.location = location
        self.cohortID = cohortID
        self.students = student
        self.mentor = [mentor]
        self.leadInstructor = leadInstructor
        self.classUUID = classUUID
    }
}


