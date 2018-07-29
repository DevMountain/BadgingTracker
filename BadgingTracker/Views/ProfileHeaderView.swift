//
//  ProfileHeaderView.swift
//  BadgingTracker
//
//  Created by Jayden Garrick on 7/6/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import UIKit

class ProfileHeaderView: UIView {
    
    // MARK: - Properties
    let profilePictureImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 150 / 2
        imageView.backgroundColor = .lightGray
        return imageView
    }()
    
    let studentNameLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    let cityAndCourseLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let locationImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    func setConstraints() {
        addSubview(profilePictureImageView)
        profilePictureImageView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 60, paddingLeft: 112, paddingBottom: 0, paddingRight: 112, width: 150, height: 150)
    }
    
}










