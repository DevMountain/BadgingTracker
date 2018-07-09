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
    var databaseRef : DatabaseReference = Database.database().reference().child("user")
    
    func fetchuser(email: String, password:String, completion: @escaping (CRStudent?) -> Void) {
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
              
                let createStudent = CRStudent(jsonDictionary: dictionary, identifier: userID)
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
//            guard let uid = user?.uid else {completion(false);return}
            guard let email = user?.email else {completion(false);return}
            guard let key = user?.uid else { return }
            let student = CRStudent(name: "TedsName", title: "Student", description: "I'm lookn not to be broke lol", phone: "8015810212", email: email, location: "SLC", photo: nil, links: [], graduationDate: Date(), currentClasses: nil, previousClasses: nil, uuid: key)
            
            let values:[String: Any] = [
                "name" : student.name,
                "title" : student.title,
                "description" : student.description,
                "phone" : student.phone,
                "email": student.email,
                "photo": student.photo,
                "links": student.links,
                "graduationDate": student.graduationDate.timeIntervalSince1970,
                "currentClasses": student.currentClasses,
                "previousClasses": student.previousClasses,
                "uuid" : student.uuid
                
            ]
            
            self.databaseRef.child(key).updateChildValues(values, withCompletionBlock: { (error, ref) in
                if let error = error {
                    print("Error updating user \(error.localizedDescription)")
                    completion(false)
                }
                 completion(true)
            })

           
        }
    }
    
    
    
}

