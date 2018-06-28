//
//  CRMentor.swift
//  BadgingTracker
//
//  Created by Christian Riboldi on 6/28/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import Foundation

class CRMentor: CRStudent {
    
    var currentClasses: [CRClass]?
    
    init(name: String, title: String, description: String, phone: String, email: String, location: String, photo: URL?, links: [URL]?, graduationDate: Date, currentClass: CRClass?, previousClasses: [CRClass]?, uuid: UUID = UUID(), currentClasses: [CRClass]?) {
        super.init(name: name, title: title, description: description, phone: phone, email: email, location: location, photo: photo, links: links, graduationDate: graduationDate, currentClass: currentClass, previousClasses: previousClasses, uuid: uuid)
        self.currentClasses = currentClasses
    }
    
}
