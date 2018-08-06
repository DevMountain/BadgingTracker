//
//  UserController.swift
//  BadgingTracker
//
//  Created by Christian Riboldi on 8/1/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import Foundation

class UserController {
    
    let leadMentor1 = LeadIntructor(name: "Karl Pfister", title: "iOS Lead Instructor", description: "I run the iOS development course in the Salt Lake Campus. I'm a passionate iOS developer and teacher.", phone: "801-465-1343", email: "ikarl@devmountain.com", currentLocation: "Salt Lake City, Utah", profilePhoto: "profile_karl", contactLink: nil, graduationDate: Date.from(year: 2013, month: 08, day: 20) , previousClass: ["ios12"], currentClass: ["ios19","ios20"], userUuid: "leadMentor1", hasBadged: true, hasGraduated: true)
    let mentor1 = Mentor(name: "Frank", title: "iOS Lead Mentor", description: "I'm a Lead Mentor for DevMountain's Immersive iOS Developer course. I went through this course a half a year ago and it's been life changing for me.", phone: "801-523-1252", email: "frank@devMountain.com", currentLocation: "Lehi, Utah", profilePhoto: "profile_frank", contactLink: nil, graduationDate: Date.from(year: 2017, month: 10, day: 12), previousClass: ["ios17","ios18"], currentClass: ["ios20"], userUuid: "mentor1", hasBadged: true, hasGraduated: true)
    let mentor2 = Mentor(name: "Nick", title: "iOS Lead Mentor", description: "I'm a Lead Mentor for DevMountain's Immersive iOS Developer course.", phone: "801-214-1238", email: "nickk@devMountain.com", currentLocation: "Salt Lake City, Utah", profilePhoto: "profile_nick", contactLink: nil, graduationDate: Date.from(year: 2017, month: 3, day: 8), previousClass: ["ios15"], currentClass: ["ios19"], userUuid: "mentor2", hasBadged: true, hasGraduated: true)
    let mentor3 = Mentor(name: "Jayden", title: "iOS Mentor", description: "I'm a Mentor for DevMountain's Immersive iOS Developer course.", phone: "801-214-1238", email: "jayden@devMountain.com", currentLocation: "Salt Lake City, Utah", profilePhoto: "profile_jayden", contactLink: nil, graduationDate: Date.from(year: 2017, month: 10, day: 12), previousClass: ["ios17"], currentClass: ["ios20"], userUuid: "mentor3", hasBadged: true, hasGraduated: true)
    let mentor4 = Mentor(name: "Christian", title: "iOS Mentor", description: "I'm a Mentor for DevMountain's Immersive iOS Developer course.", phone: "801-214-1238", email: "christian@devMountain.com", currentLocation: "Salt Lake City, Utah", profilePhoto: "profile_christian", contactLink: nil, graduationDate: Date.from(year: 2018, month: 04, day: 23), previousClass: [String](), currentClass: ["ios19"], userUuid: "mentor4", hasBadged: false)
    let student1 = User(name: "Adam Moskovich", title: "iOS Developer", description: "I'm an passionate iOS Developer", phone: "801-234-1241", email: "adam@gmail.com", currentLocation: "Salt Lake City, Utah", profilePhoto: "profile_adam", contactLink: nil, graduationDate: Date.from(year: 2018, month: 08, day: 03), previousClass: [String](), currentClass: ["ios19"], userUuid: "student1", hasBadged: true)
    let student2 = User(name: "Dallin McConnell", title: "iOS Developer", description: "I'm an passionate iOS Developer", phone: "801-125-4532", email: "dallin@gmail.com", currentLocation: "Salt Lake City, Utah", profilePhoto: "", contactLink: nil, graduationDate: Date.from(year: 2018, month: 08, day: 03), previousClass: [String](), currentClass: ["ios19"], userUuid: "student2", hasBadged: true)
    let student3 = User(name: "Josh Danner", title: "iOS Developer", description: "I'm an passionate iOS Developer", phone: "801-474-2673", email: "josh@gmail.com", currentLocation: "Salt Lake City, Utah", profilePhoto: "profile_josh", contactLink: nil, graduationDate: Date.from(year: 2018, month: 08, day: 03), previousClass: [String](), currentClass: ["ios19"], userUuid: "student3", hasBadged: true)
    let student4 = User(name: "Trevor Adcock", title: "iOS Developer", description: "I'm an passionate iOS Developer", phone: "801-632-6345", email: "trevor@gmail.com", currentLocation: "Salt Lake City, Utah", profilePhoto: "", contactLink: nil, graduationDate: Date.from(year: 2018, month: 08, day: 03), previousClass: [String](), currentClass: ["ios19"], userUuid: "student4", hasBadged: true)
    let student5 = User(name: "Ben Adams", title: "iOS Developer", description: "I'm an passionate iOS Developer", phone: "801-235-1534", email: "ben@gmail.com", currentLocation: "Salt Lake City, Utah", profilePhoto: "profile_ben", contactLink: nil, graduationDate: Date.from(year: 2018, month: 08, day: 03), previousClass: [String](), currentClass: ["ios19"], userUuid: "student5", hasBadged: true)
    let student6 = User(name: "Caston Boyd", title: "iOS Developer", description: "I'm an passionate iOS Developer", phone: "801-321-2352", email: "caston@gmail.com", currentLocation: "Salt Lake City, Utah", profilePhoto: "profile_caston", contactLink: nil, graduationDate: Date.from(year: 2018, month: 08, day: 03), previousClass: [String](), currentClass: ["ios19"], userUuid: "student6", hasBadged: false)
    let student7 = User(name: "Huzaifa Gadiwala", title: "iOS Developer", description: "I'm an passionate iOS Developer", phone: "801-342-2634", email: "huzaifa@gmail.com", currentLocation: "Salt Lake City, Utah", profilePhoto: "profile_huzaifa", contactLink: nil, graduationDate: Date.from(year: 2018, month: 08, day: 03), previousClass: [String](), currentClass: ["ios19"], userUuid: "student7", hasBadged: false)
    let student8 = User(name: "John Hancock", title: "iOS Developer", description: "I'm an passionate iOS Developer", phone: "801-346-2643", email: "johnh@gmail.com", currentLocation: "Salt Lake City, Utah", profilePhoto: "profile_john", contactLink: nil, graduationDate: Date.from(year: 2018, month: 08, day: 03), previousClass: [String](), currentClass: ["ios19"], userUuid: "student8", hasBadged: true)
    let student9 = User(name: "Justin Trautman", title: "iOS Developer", description: "I'm an passionate iOS Developer. Before coming to DevMountain I had a few oportunities to learn programming. Through this course I was able to learn and grow as a person and a Developer.", phone: "801-234-1543", email: "justin@gmail.com", currentLocation: "Salt Lake City, Utah", profilePhoto: "profile_justin", contactLink: nil, graduationDate: Date.from(year: 2018, month: 08, day: 03), previousClass: [String](), currentClass: ["ios19"], userUuid: "student9", hasBadged: true)
    let student10 = User(name: "Kelly Doan", title: "iOS Developer", description: "I'm for Vietnam and currently live in the Bay Area. I wanted to study iOS Development so that I could change the course of my life. It's been an incredible journey so far.", phone: "801-342-6243", email: "kelly@gmail.com", currentLocation: "San Fransisco, California", profilePhoto: "profile_kelly", contactLink: nil, graduationDate: Date.from(year: 2018, month: 07, day: 03), previousClass: [String](), currentClass: ["ios19"], userUuid: "student10", hasBadged: true)
    let student11 = User(name: "Landon McKell", title: "iOS Developer", description: "I'm an passionate iOS Developer", phone: "801-235-1364", email: "landonm@gmail.com", currentLocation: "Salt Lake City, Utah", profilePhoto: "profile_landon", contactLink: nil, graduationDate: Date.from(year: 2018, month: 08, day: 03), previousClass: [String](), currentClass: ["ios19"], userUuid: "student11", hasBadged: true)
    let student12 = User(name: "Matt Schweppe", title: "iOS Developer", description: "I'm an passionate iOS Developer", phone: "801-623-2353", email: "matts@gmail.com", currentLocation: "Salt Lake City, Utah", profilePhoto: "", contactLink: nil, graduationDate: Date.from(year: 2018, month: 08, day: 03), previousClass: [String](), currentClass: ["ios19"], userUuid: "student12", hasBadged: true)
    
    let usersDictionary: [String: User]
    let students: [User]
    let mentors: [User]
    let instructor: User
    var loggedInUser: User!
    var users: [User] {
        return usersDictionary.compactMap { $0.value }.sorted(by: { (userA, userB) -> Bool in
            return userA.name < userB.name
        })
    }
    
    static let shared = UserController()
    
    init() {
        self.usersDictionary = ["leadMentor1":leadMentor1,
                                "mentor1":mentor1,
                                "mentor2":mentor2,
                                "mentor3":mentor3,
                                "mentor4":mentor4,
                                "student1":student1,
                                "student2":student2,
                                "student3":student3,
                                "student4":student4,
                                "student5":student5,
                                "student6":student6,
                                "student7":student7,
                                "student8":student8,
                                "student9":student9,
                                "student10":student10,
                                "student11":student11,
                                "student12":student12]
        
        self.students = [
                        student1,
                        student2,
                        student3,
                        student4,
                        student5,
                        student6,
                        student7,
                        student8,
                        student9,
                        student10,
                        student11,
                        student12]
        
        self.mentors = [mentor1,
                        mentor2,
                        mentor3,
                        mentor4]
        
        self.instructor = leadMentor1
    }
    
    func user(at index: Int) -> User {
        return users[index]
    }
}
