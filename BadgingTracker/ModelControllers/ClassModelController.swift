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
    private var classDatabaseRef : DatabaseReference = Database.database().reference().child("classes")
    private var assessmentDescriptionRef : DatabaseReference = Database.database().reference().child("assessementDescriptions")
    private var assessmentRef : DatabaseReference = Database.database().reference().child("assessments")
    private var requirementDescriptionRef : DatabaseReference = Database.database().reference().child("requirementDescriptions")
    private var requirementRef : DatabaseReference = Database.database().reference().child("requirements")
    func createClass(class: String, completion: @escaping ( Bool) -> Void) {
        let newclass = Class(title: "IOS19", location: "Salt Lake ctiy", cohortID: "IOSSL19", leadInstructorUUID: "Xov4JFkEcYZWoFc4jvGkK5061wp2", scoredAssessmentUUIDs:["LGbLNvTYhO-4bQd9SjW": ["123456"]], assessmentDescriptionUUIDs: [UUID().uuidString])
        self.classDatabaseRef.childByAutoId().updateChildValues(newclass.dictionaryRepresentation) { (error, ref) in
            if let  error = error {
                print("Error updating new class\(error.localizedDescription)")
                completion(false)
            }
            completion(true)
        }
    }
    
    func createAssessementDescription(completion: @escaping (Bool) -> Void) {
        let assessementDescription = AssessmentDescription(title: "Coding style", description: "no spacing ", requiredPassingPercent: 80.0, requirementDescriptionUUIDs: [UUID().uuidString], uuid: UUID())
        self.assessmentDescriptionRef.childByAutoId().updateChildValues(assessementDescription.dictionaryRepresentation) { (err, ref) in
            if let err = err {
                print("Error updating assessmentDescription\(err.localizedDescription)")
                completion(false)
            }
            completion(true)
        }
    }
    
    func createAssessment(completion: @escaping (Bool) -> Void) {
        let newAssessment = Assessment(hasBadge: false, requirementUUIDs: [UUID().uuidString], assessmentDescriptionUUID: UUID().uuidString, uuid: UUID())
        self.assessmentRef.childByAutoId().updateChildValues(newAssessment.dictionaryRepresentation) { (err, ref) in
            if let err = err {
                print("Error updating assessment \(err.localizedDescription)")
                completion(false)
            }
            completion(true)
        }
    }
    
    func createRequiredmentDescription(completion: @escaping (Bool) -> Void) {
        let newRequiredDescriotion = RequirementDescription(title: "CoreData", description: "Use NSFetchResultControler", maxScore: 10, uuid: UUID())
        
        self.requirementDescriptionRef.childByAutoId().updateChildValues(newRequiredDescriotion.dictionaryRepresentation) { (err, ref) in
            if let err = err {
                print("Error updating assessment \(err.localizedDescription)")
                completion(false)
            }
            completion(true)
        }
    }
    func createRequirement(completion: @escaping (Bool) -> Void) {
        let newRequirement = Requirement(score: 10.0, requirementDescriptionUUID: UUID().uuidString, uuid: UUID())
        self.requirementRef.childByAutoId().updateChildValues(newRequirement.dictionaryRepresentation) { (err, ref) in
            if let err = err {
                print("Error updating assessment \(err.localizedDescription)")
                completion(false)
            }
            completion(true)
        }
    }
    
    func fetchClasses(completion: @escaping ([Class]?) -> Void) {
        let classRefHandle = classDatabaseRef.observe(.value) { (snapShot) in
            guard let classDict = snapShot.value as? [String:[String: Any]] else { completion(nil) ; return}
            var classes: [Class] = []
            for (key, value) in classDict {
//                print("KEY 🗝", key)
//                print("VALUE 🐝", value)
                let devClass = Class(jsonDictionary: value, identifier: key)
                print(devClass?.cohortID)
            }
        }
      
    }
}
