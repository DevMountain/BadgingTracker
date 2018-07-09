//
//  AuthenticationController.swift
//  BadgingTracker
//
//  Created by Thao Doan on 7/3/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import Foundation
import Firebase

class AuthenticationController {
    static var shared: AuthenticationController = AuthenticationController()
    var databaseRef : DatabaseReference = Database.database().reference().child("users")
    
    func fetchuser(email: String, password:String, completion: @escaping (Student?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if let error = error{
                print("Error  fetching new user \(error.localizedDescription)")
                completion(nil)
                return
            }
            guard let userID = Auth.auth().currentUser?.uid else {completion(nil); return}
            
            self.databaseRef.child(userID).observeSingleEvent(of: .value, with: { (snapShot) in
                print(snapShot)
                guard let dictionary = snapShot.value as? [String:Any] else {completion(nil);return}
              
                let createStudent = Student(jsonDictionary: dictionary, uuidString: userID)
                print(createStudent ?? "Can't create student")
                completion(createStudent)
                
            })
        }
    }
    
    func createUser(email: String, password : String, completion: @escaping (Bool)-> Void) {
        
        Auth.auth().createUser(withEmail: email, password: password) { (user, err) in
            if let err = err {
                print("Error creating new user \(err)")
                completion(false)
                return
            }
            guard let email = user?.email else {completion(false);return}
            guard let key = user?.uid else { return }
            let student = LeadIntructor(name: "Karl the German", title: "Lead Instructor", description: "I wanna be the very best. The best there ever was! To find them is my real quest. To train them is my cause!", phone: "8014562376", email: email, currentLocation: "Salt Lake City", profilePhoto: "", contactLink: [], graduationDate: Date(), previousClass: [], currentClass: [], userUuid: key)

            self.databaseRef.child(key).updateChildValues(student.dictionaryRepresentation, withCompletionBlock: { (error, ref) in
                if let error = error {
                    print("Error updating user \(error.localizedDescription)")
                    completion(false)
                }
                 completion(true)
            })
        }
        
    }
   
}

