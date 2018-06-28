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
    }
    var title : String
    var location : String
    var cohortID : String
    var students : KEAssesmentDescription
    var mentor : [String] // mentorUUIS
    var leadIntructor : [String] //LeadUUID ?
    var classUUID : UUID
    init?(title: String, location :String, cohortID : String, students: KEAssesmentDescription,mentor: [String] = [String](), leadIntructor : [String] = [String](), classUUID: UUID = UUID()) {
        self.title = title
        self.location = location
        self.cohortID = cohortID
        self.students = students
        self.mentor = mentor
        self.leadIntructor = leadIntructor
        self.classUUID = classUUID
    }
}


