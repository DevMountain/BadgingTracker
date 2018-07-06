//
//  Class.swift
//  BadgingTracker
//
//  Created by Thao Doan on 6/27/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import UIKit

class Class {
    
    struct Constants {
        static let titleKey: String = "title"
        static let locationKey: String = "location"
        static let cohortIDKey: String = "cohortID"
        static let studentsKey: String = "students"
        static let mentorsKey: String = "mentors"
        static let leadInstructorKey: String = "leadInstructor"
        static let scoredAssessmentsKey: String = "scoredAssessments"
        static let assessmentDescriptionsKey: String = "assessmentDescriptions"
    }
    
    var title: String
    var location: String
    var cohortID: String
    
    var studentUUIDs: [String]
    var mentorUUIDs: [String]
    var leadInstructorUUID: String
    var scoredAssessmentUUIDs: [StudentID: [String]]
    var assessmentDescriptionUUIDs: [String]
    
    var students: [Student]?
    var mentors: [Mentor]?
    var leadInstructor: LeadIntructor?
    var scoredAssessments: [StudentID: [Assessment]]?
    var assessmentDescriptions: [AssessmentDescription]?
    
    var uuid: UUID
    var id: String {
        return uuid.uuidString
    }
    var dictionaryRepresentation: [String: Any] {
        var dictionary: [String: Any] = [
            Constants.titleKey: self.title,
            Constants.locationKey: self.location,
            Constants.cohortIDKey: self.cohortID,
            Constants.studentsKey: self.studentUUIDs.toDictionary(withDefaultValue: true),
            Constants.mentorsKey: self.mentorUUIDs.toDictionary(withDefaultValue: true),
            Constants.leadInstructorKey: self.leadInstructorUUID,
            Constants.assessmentDescriptionsKey: self.assessmentDescriptionUUIDs.toDictionary(withDefaultValue: true)
        ]
        if let scoredAssessments = self.scoredAssessments {
            var assessmentsDictionary = [String:[String:Bool]]()
            for (studentID, assessments) in scoredAssessments {
                assessmentsDictionary[studentID] = assessments.compactMap { $0.id }.toDictionary(withDefaultValue: true)
            }
            dictionary[Constants.scoredAssessmentsKey] = assessmentsDictionary
        }
        return dictionary
    }
    var jsonData: Data? {
        return try? JSONSerialization.data(withJSONObject: dictionaryRepresentation, options: .prettyPrinted)
    }
    
    init(title: String, location: String, cohortID: String, studentUUIDs: [String] = [String](), mentorUUIDs: [String] = [String](), leadInstructorUUID: String, scoredAssessmentUUIDs: [StudentID: [String]], assessmentDescriptionUUIDs: [String], uuid: UUID = UUID()) {
        
        self.title = title
        self.location = location
        self.cohortID = cohortID
        self.studentUUIDs = studentUUIDs
        self.mentorUUIDs = mentorUUIDs
        self.leadInstructorUUID = leadInstructorUUID
        self.scoredAssessmentUUIDs = scoredAssessmentUUIDs
        self.assessmentDescriptionUUIDs = assessmentDescriptionUUIDs
        self.uuid = uuid
    }
    
    init?(jsonDictionary: [String: Any], identifier: String) {
        guard let title = jsonDictionary[Constants.titleKey] as? String,
            let location = jsonDictionary[Constants.locationKey] as? String,
            let cohortID = jsonDictionary[Constants.cohortIDKey] as? String,
            let studentUUIDs = jsonDictionary[Constants.studentsKey] as? [String: Bool],
            let mentorUUIDs = jsonDictionary[Constants.mentorsKey] as? [String: Bool],
            let leadInstructorUUID = jsonDictionary[Constants.leadInstructorKey] as? String,
            let scoredAssessmentUUIDs = jsonDictionary[Constants.scoredAssessmentsKey] as? [StudentID: [String]],
            let assessmentDescriptionUUIDs = jsonDictionary[Constants.assessmentDescriptionsKey] as? [String: Bool],
            let uuid = UUID(uuidString: identifier) else {
                return nil
        }
        self.title = title
        self.location = location
        self.cohortID = cohortID
        self.studentUUIDs = Array(studentUUIDs.keys)
        self.mentorUUIDs = Array(mentorUUIDs.keys)
        self.leadInstructorUUID = leadInstructorUUID
        self.scoredAssessmentUUIDs = scoredAssessmentUUIDs
        self.assessmentDescriptionUUIDs = Array(assessmentDescriptionUUIDs.keys)
        self.uuid = uuid
    }
}


