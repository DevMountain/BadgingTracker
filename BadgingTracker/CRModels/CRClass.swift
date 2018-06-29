//
//  CRClass.swift
//  BadgingTracker
//
//  Created by Christian Riboldi on 6/28/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import Foundation

class CRClass {
    
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
    var students: [CRStudent]?
    var mentors: [CRMentor]?
    var leadInstructor: CRInstructor?
    var scoredAssessments: [StudentID: [CRAssessment]]?
    var assessmentDescriptions: [CRAssessmentDescription]?
    var uuid: UUID
    var id: String {
        return uuid.uuidString
    }
    var dictionaryRepresentation: [String: Any] {
        var dictionary: [String: Any] = [
            Constants.titleKey: self.title,
            Constants.locationKey: self.location,
            Constants.cohortIDKey: self.cohortID
        ]
        if let students = self.students {
            dictionary[Constants.studentsKey] = students.compactMap { $0.id }.toDictionary(withDefaultValue: true)
        }
        if let mentors = self.mentors {
            dictionary[Constants.mentorsKey] = mentors.compactMap { $0.id }.toDictionary(withDefaultValue: true)
        }
        if let leadInstructor = self.leadInstructor {
            dictionary[Constants.leadInstructorKey] = leadInstructor.id
        }
        if let scoredAssessments = self.scoredAssessments {
            var assessmentsDictionary = [String:[String:Bool]]()
            for (studentID, assessments) in scoredAssessments {
                assessmentsDictionary[studentID] = assessments.compactMap { $0.id }.toDictionary(withDefaultValue: true)
            }
            dictionary[Constants.scoredAssessmentsKey] = assessmentsDictionary
        }
        if let assessmentDescriptions = self.assessmentDescriptions {
            dictionary[Constants.assessmentDescriptionsKey] = assessmentDescriptions.compactMap { $0.id }.toDictionary(withDefaultValue: true)
        }
        return dictionary
    }
    var jsonData: Data? {
        return try? JSONSerialization.data(withJSONObject: dictionaryRepresentation, options: .prettyPrinted)
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
    
    init?(jsonDictionary: [String: Any], identifier: String) {
        guard let title = jsonDictionary[Constants.titleKey] as? String,
            let location = jsonDictionary[Constants.locationKey] as? String,
            let cohortID = jsonDictionary[Constants.cohortIDKey] as? String,
            let uuid = UUID(uuidString: identifier) else {
                return nil
        }
        self.title = title
        self.location = location
        self.cohortID = cohortID
        self.uuid = uuid
        
        if let students = jsonDictionary[Constants.studentsKey] as? [String: Bool] {
//            self.students = students get students from Firebase
        }
        if let mentors = jsonDictionary[Constants.mentorsKey] as? [String: Bool] {
//            self.mentors = mentors get mentors from Firebase
        }
        if let leadInstructor = jsonDictionary[Constants.leadInstructorKey] as? String {
//            self.leadInstructor = leadInstructor get leadInstructor from Firebase
        }
        if let scoredAssessments = jsonDictionary[Constants.scoredAssessmentsKey] as? [String: Any] {
//            self.scoredAssessments = scoredAssessments get scoredAssessments from Firebase
        }
        if let assessmentDescriptions = jsonDictionary[Constants.assessmentDescriptionsKey] as? [String: Bool] {
//            self.assessmentDescriptions = assessmentDescriptions get assessmentDescriptions from Firebase
        }
    }
}
