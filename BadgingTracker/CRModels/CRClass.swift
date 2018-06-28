//
//  CRClass.swift
//  BadgingTracker
//
//  Created by Christian Riboldi on 6/28/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import Foundation

class CRClass {
    
    var title: String
    var location: String
    var cohortID: String
    var students: [CRStudent]
    var mentors: [CRMentor]
    var leadInstructor: CRInstructor
    var scoredAssessments: [StudentID: [CRAssessment]]
    var assessmentDescriptions: [CRAssessmentDescription]
    var uuid: UUID
    var id: String {
        return uuid.uuidString
    }
    
    init(title: String, location: String, cohortID: String, students: [CRStudent] = [CRStudent](), mentors: [CRMentor] = [CRMentor](), leadInstructor: CRInstructor, scoredAssessments: [StudentID: [CRAssessment]], assessmentDescriptions: [CRAssessmentDescription], uuid: UUID = UUID()) {
        
        self.title = title
        self.location = location
        self.cohortID = cohortID
        self.students = students
        self.mentors = mentors
        self.leadInstructor = leadInstructor
        self.scoredAssessments = scoredAssessments
        self.assessmentDescriptions = assessmentDescriptions
        self.uuid = uuid
    }
    
    init?(jsonDictionary: [String: Any], keyValue: String) {
        
    }
}
