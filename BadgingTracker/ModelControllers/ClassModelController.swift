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
    private var postsRef : DatabaseReference = Database.database().reference().child("posts")
    
    
    // Create Functions
    func createClass(classTitle: String, completion: @escaping ( Bool) -> Void) {
//        let newclass = Class(title: classTitle, location: "Salt Lake City", cohortID: "SL\(classTitle)")
//        self.classDatabaseRef.childByAutoId().updateChildValues(newclass.dictionaryRepresentation) { (error, ref) in
//            if let  error = error {
//                print("Error updating new class\(error.localizedDescription)")
//                completion(false)
//            }
//            completion(true)
//        }
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
    
    func createPosts(completion: @escaping (Bool) -> Void) {
        let newPost = Post(message: "Alogithm - Word used by programmers when they do not want to explain what they did", senderUUID: UUID().uuidString, timestamp: Date(), likes: ["Trevor","Frank"], uuid: UUID())
        
        self.postsRef.childByAutoId().updateChildValues(newPost.dictionaryRepresentation) { (err, ref) in
            if let err = err {
                print("Error updating assessment \(err.localizedDescription)")
                completion(false)
            }
            completion(true)
        }
    }
    
    // Fetch Functions
    func fetchClasses(completion: @escaping ([Class]?) -> Void) {
        classDatabaseRef.observe(.value) { (snapShot) in
            guard let classDict = snapShot.value as? [String:[String: Any]] else { completion(nil) ; return}
            let classes: [Class] = classDict.compactMap { Class(jsonDictionary: $0.value, identifier: $0.key) }
            
            for devClass in classes {
                self.fetchUsers(withUserIDs: devClass.studentUUIDs, completion: { (students) in
                    devClass.students = students
                })
                self.fetchUsers(withUserIDs: devClass.mentorUUIDs, completion: { (mentors) in
                    devClass.mentors = mentors?.compactMap { $0 as? Mentor }
                })
                self.fetchUser(withUserID: devClass.leadInstructorUUID, completion: { (leadInstructor) in
                    if let leadInstructor = leadInstructor as? LeadIntructor {
                        devClass.leadInstructor = leadInstructor
                    }
                })
                self.fetchAssessmentDescriptions(withIDs: devClass.assessmentDescriptionUUIDs, completion: { (assessmentDescriptions) in
                    devClass.assessmentDescriptions = assessmentDescriptions
                })
                for (studentID, assessmentIDDict) in devClass.scoredAssessmentUUIDs {
                    for (assessmentID, _) in assessmentIDDict {
                        self.fetchAssessment(withID: assessmentID, completion: { (assessment) in
                            guard let assessment = assessment else {
                                return
                            }
                            if devClass.scoredAssessments[studentID] == nil {
                                devClass.scoredAssessments[studentID] = [Assessment]()
                            }
                            devClass.scoredAssessments[studentID]?.append(assessment)
                        })
                    }
                }
                
            }
            completion(classes)
        }
    }
    
    func fetchAssessmentDescriptions(withIDs ids: [String], completion: @escaping ([AssessmentDescription]?) -> Void) {
        var assessmentDescriptions = [AssessmentDescription]()
        var count = 0
        for id in ids {
            fetchAssessmentDescription(withID: id) { (assessmentDescription) in
                count += 1
                if let assessmentDescription = assessmentDescription {
                    assessmentDescriptions.append(assessmentDescription)
                }
                if count == ids.count - 1 {
                    completion(assessmentDescriptions)
                }
            }
        }
    }
    
    func fetchAssessmentDescription(withID id: String, completion: @escaping (AssessmentDescription?) -> Void) {
        
    }
    func fetchAssessments(withID ids: [String], completion: @escaping ([Assessment]?) -> Void) {
        
    }
    
    func fetchAssessment(withID id: String, completion: @escaping (Assessment?) -> Void) {
        
    }
   
    
    func fetchRequirementDescriptions
        (withID id: String, completion: @escaping (RequirementDescription?) -> Void) {
        
    }
    
    func fetchRequirement(withID id: String, completion: @escaping (Requirement?) -> Void) {
        
    }
    
    func fetchUsers(withUserIDs ids: [String], completion: @escaping ([Student]?) -> Void) {
        var users = [Student]()
        var count = 0
        for id in ids {
            fetchUser(withUserID: id) { (user) in
                count += 1
                if let user = user {
                    users.append(user)
                }
                if count == ids.count - 1 {
                    completion(users)
                }
            }
        }
    }
    
    func fetchUser(withUserID id: String, completion: @escaping (Student?) -> Void) {
        // Check the user cache and return a Student if there already is one.
        
        
    }
    
    func fetchPosts(forUserId id: String, completion: @escaping ([Post]?) -> Void) {
        
    }
}
    
    

