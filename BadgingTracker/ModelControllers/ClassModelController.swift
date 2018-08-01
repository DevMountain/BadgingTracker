//
//  ClassModelController.swift
//  BadgingTracker
//
//  Created by Thao Doan on 7/5/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import Foundation
import Firebase

class ClassModelController {
    
    static let shared : ClassModelController = ClassModelController()
    private var classDatabaseRef : DatabaseReference = Database.database().reference().child("class")
    private var assessmentDescriptionRef : DatabaseReference = Database.database().reference().child("assessementDescription")
    private var assessmentRef : DatabaseReference = Database.database().reference().child("assessment")
    private var requirementDescriptionRef : DatabaseReference = Database.database().reference().child("requirementDescription")
    private var requirementRef : DatabaseReference = Database.database().reference().child("requirement")
    func createClass(class: String, completion: @escaping ( Bool) -> Void) {
        var newclass = Class(title: "IOS19", location: "Salt Lake ctiy", cohortID: "IOSSL19", leadInstructorUUID: "Xov4JFkEcYZWoFc4jvGkK5061wp2", scoredAssessmentUUIDs:["LGbLNvTYhO-4bQd9SjW": ["123456"]], assessmentDescriptionUUIDs: [UUID().uuidString])
        let value : [String:Any] = [
            Class.Constants.titleKey : newclass.title,
            Class.Constants.locationKey : newclass.location,
            Class.Constants.cohortIDKey : newclass.cohortID,
            Class.Constants.leadInstructorKey: newclass.leadInstructorUUID,
            Class.Constants.scoredAssessmentsKey : newclass.scoredAssessments,
            Class.Constants.assessmentDescriptionsKey : newclass.assessmentDescriptionUUIDs
        ]
        self.classDatabaseRef.childByAutoId().updateChildValues(value) { (error, ref) in
            if let  error = error {
                print("Error updating new class\(error.localizedDescription)")
                completion(false)
            }
            completion(true)
        }
    }
    
    func createAssessementDescription(completion: @escaping (Bool) -> Void) {
        var assessementDescription = AssessmentDescription(title: "Coding style", description: "no spacing ", requiredPassingPercent: 80.0, requirementDescriptionUUIDs: [UUID().uuidString], uuid: UUID())
        let value : [String:Any] = [
            AssessmentDescription.Constants.titleKey : assessementDescription.title,
            AssessmentDescription.Constants.descriptionKey : assessementDescription.description,
            AssessmentDescription.Constants.requiredPassingPercentKey : assessementDescription.requiredPassingPercent,
            AssessmentDescription.Constants.requirementDescriptionsKey : assessementDescription.requirementDescriptionUUIDs,
        ]
        self.assessmentDescriptionRef.childByAutoId().updateChildValues(value) { (err, ref) in
            if let err = err {
                print("Error updating assessmentDescription\(err.localizedDescription)")
                completion(false)
            }
            completion(true)
        }
    }
    
    func createAssessment(completion: @escaping (Bool) -> Void) {
        var newAssessment = Assessment(hasBadge: false, requirementUUIDs: [UUID().uuidString], assessmentDescriptionUUID: UUID().uuidString, uuid: UUID())
        let value : [String:Any] = [
            Assessment.Constants.hasBadgeKey : newAssessment.hasBadge,
            Assessment.Constants.requirementsKey : newAssessment.requirementUUIDs,
            Assessment.Constants.assessmentDescriptionKey : newAssessment.assessmentDescriptionUUID
        ]
        self.assessmentRef.childByAutoId().updateChildValues(value) { (err, ref) in
            if let err = err {
                print("Error updating assessment \(err.localizedDescription)")
                completion(false)
            }
            completion(true)
        }
    }
    
    func createRequiredmentDescription(completion: @escaping (Bool) -> Void) {
        var newRequiredDescriotion = RequirementDescription(title: "CoreData", description: "Use NSFetchResultControler", maxScore: 10, uuid: UUID())
        let value : [String:Any] = [
            RequirementDescription.Constants.titleKey : newRequiredDescriotion.title,
            RequirementDescription.Constants.maxScoreKey : newRequiredDescriotion.maxScore,
            RequirementDescription.Constants.descriptionKey : newRequiredDescriotion.description
        ]
        
        self.requirementDescriptionRef.childByAutoId().updateChildValues(value) { (err, ref) in
            if let err = err {
                print("Error updating assessment \(err.localizedDescription)")
                completion(false)
            }
            completion(true)
        }
    }
    func createRequirement(completion: @escaping (Bool) -> Void) {
        var newRequirement = Requirement(score: 10.0, requirementDescriptionUUID: UUID().uuidString, uuid: UUID())
        let value : [String:Any] = [
            Requirement.Constants.scoreKey : newRequirement.score,
            Requirement.Constants.requirementDescriptionKey : newRequirement.requirementDescriptionUUID
        ]
        self.requirementRef.childByAutoId().updateChildValues(value) { (err, ref) in
            if let err = err {
                print("Error updating assessment \(err.localizedDescription)")
                completion(false)
            }
            completion(true)
        }
    }
}
