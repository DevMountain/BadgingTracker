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
//            let student = Student(name: "Kelly", title: "iOS student", description: "I love Swift", phone: "999999999", email: email, currentLocation: "Salt Lake City", profilePhoto: "", contactLink: [], graduationDate: Date(), previousClass: [], currentClass: [], userUuid: key)
            
            let student = Student(name: "Kelly", title: "iOS student", description: "I love Swfit", phone: "999999999", email: email, currentLocation: "Salt Lake City", profilePhoto: "", userUuid: key, hasBadged: false)
      

            self.databaseRef.child(key).updateChildValues(student.dictionaryRepresentation, withCompletionBlock: { (error, ref) in
                if let error = error {
                    print("Error updating user \(error.localizedDescription)")
                    completion(false)
                }
                 completion(true)
            })
        }
        
    }

//    func createUser(email: String, password : String, completion: @escaping (Bool)-> Void) {
//        Auth.auth().createUser(withEmail: email, password: password) { (user, err) in
//            if let err = err {
//                print("Error creating new user \(err)")
//                completion(false)
//                return
//            }
////            guard let uid = user?.uid else {completion(false);return}
//            guard let email = user?.email else {completion(false);return}
//            guard let key = user?.uid else { return }
//            let student = Student(name: "TedsName", title: "Student", description: "I'm lookn not to be broke lol", phone: "8015810212", email: email, currentLocation: "SLC", profilePhoto: "", contactLink: [], graduationDate: Date(), previousClass: [], currentClass: [], userUuid: key)
//            
//            let values:[String: Any] = [
//                "name" : student.name,
//                "title" : student.title,
//                "description" : student.description,
//                "phone" : student.phone,
//                "email": student.email,
//                "photo": student.profilePhoto,
//                "links": student.contactLinks,
//                "graduationDate": student.graduationDate.timeIntervalSince1970,
//                "currentClasses": student.currentClasses,
//                "previousClasses": student.previousClasses,
//                "uuid" : student.userUuid
//                
//            ]
//            
//            self.databaseRef.child(key).updateChildValues(values, withCompletionBlock: { (error, ref) in
//                if let error = error {
//                    print("Error updating user \(error.localizedDescription)")
//                    completion(false)
//                }
//                 completion(true)
//            })
//
//           
//        }
//    }
    
    
   
}

