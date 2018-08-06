//
//  FeedController.swift
//  BadgingTracker
//
//  Created by Christian Riboldi on 8/1/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import UIKit

class FeedPost {
    
    var hasBeenLiked: Bool
    var isPrivate: Bool
    var numberOfLikes: Int
    var text: String
    var timeSinceInMinutes: Int
    var senderID: String
    var timeSince: String {
        var timeSinceText: String
        if self.timeSinceInMinutes > 1440 {
            timeSinceText = "\(self.timeSinceInMinutes/1440) days"
        } else if self.timeSinceInMinutes > 60 {
            timeSinceText = "\(self.timeSinceInMinutes/60) hours"
        } else {
            timeSinceText = "\(self.timeSinceInMinutes) minutes"
        }
        return timeSinceText
    }
    var senderName: String {
        return UserController.shared.usersDictionary[self.senderID]?.name ?? "Unknown Sender"
    }
    var senderImage: UIImage {
        return UserController.shared.usersDictionary[self.senderID]?.profilePhotoImage ?? UIImage(named: "profile_empty_large")!
    }
    var isPrivateText: String {
        return isPrivate ? "Private" : "Public"
    }
    var likesText: String {
        return hasBeenLiked ? "\(self.numberOfLikes + 1)" : "\(self.numberOfLikes)"
    }
    
    init(hasBeenLiked: Bool, isPrivate: Bool, numberOfLikes: Int, text: String, timeSinceInMinutes: Int, senderID: String) {
        self.hasBeenLiked = hasBeenLiked
        self.isPrivate = isPrivate
        self.numberOfLikes = numberOfLikes
        self.text = text
        self.timeSinceInMinutes = timeSinceInMinutes
        self.senderID = senderID
    }
}

class FeedController {
    
    let posts: [FeedPost] = [
                             FeedPost(hasBeenLiked: false, isPrivate: false, numberOfLikes: 3, text: "Congradulations on graduating today. We're proud of all you've accomplished. If you would like to see your badges you can do so on the profile page of this app.", timeSinceInMinutes: 24, senderID: "leadMentor1"),
                             FeedPost(hasBeenLiked: true, isPrivate: false, numberOfLikes: 4, text: "Thanks for the hard work this entire cohort. We're excited to welcome your friends and family to graduation. You're free to spend time with them and meeting recruiters before we start.", timeSinceInMinutes: 125, senderID: "leadMentor1"),
                             FeedPost(hasBeenLiked: false, isPrivate: false, numberOfLikes: 1, text: "As a reminder we will be having a group project meeting here in the next couple of days. Please meet with your UX team members and plan out your presentations.", timeSinceInMinutes: 234, senderID: "mentor2"),
                             FeedPost(hasBeenLiked: true, isPrivate: false, numberOfLikes: 6, text: "Good job on your score this week! I appreciate all the hard work you've been putting in.", timeSinceInMinutes: 3920, senderID: "mentor2"),
                             FeedPost(hasBeenLiked: false, isPrivate: false, numberOfLikes: 7, text: "Hey iOS 19! Assessments have been graded and your mentor will reach out to you for a good time to have your one on one.", timeSinceInMinutes: 3923, senderID: "mentor2"),
                             FeedPost(hasBeenLiked: true, isPrivate: true, numberOfLikes: 10, text: "Hey man, good work on getting a 90% on your assessment this week. It was a hard week and you put in a lot of effort.", timeSinceInMinutes: 4506, senderID: "mentor3"),
                             FeedPost(hasBeenLiked: false, isPrivate: false, numberOfLikes: 11, text: "Great work this week. We've graded the assessments and are ready to begin one on ones.", timeSinceInMinutes: 6038, senderID: "mentor2"),
                             FeedPost(hasBeenLiked: false, isPrivate: false, numberOfLikes: 5, text: "Thank you for your hard work this week. We look forward to seeing you at the climb night this Thursday. If you have any questions ask Nick.", timeSinceInMinutes: 12092, senderID: "leadMentor1"),
                             FeedPost(hasBeenLiked: true, isPrivate: false, numberOfLikes: 3, text: "Hey iOS 19, we have graded the Assessment 1. Good job on working so hard on week 1.", timeSinceInMinutes: 29392, senderID: "mentor2"),
                             FeedPost(hasBeenLiked: true, isPrivate: false, numberOfLikes: 12, text: "Welcome iOS 19 to the DevMountain Badging App. From here you'll be able to see your progress and be notified of when badging assessments are finished being graded", timeSinceInMinutes: 30895, senderID: "leadMentor1")]
    
    static let shared = FeedController()
}

