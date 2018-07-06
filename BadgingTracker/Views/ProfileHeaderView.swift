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
        imageView.backgroundColor = #colorLiteral(red: 0.8274509804, green: 0.8235294118, blue: 0.8274509804, alpha: 1)
        imageView.layer.cornerRadius = 150 / 2
        return imageView
    }()
    
    let studentNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.2274509804, green: 0.2274509804, blue: 0.2274509804, alpha: 1)
        label.text = "Matt Schwepe"
        label.font = UIFont.mainFontMedium(ofSize: 18)
        return label
    }()
    
    let cityAndCourseLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.5568627451, green: 0.5568627451, blue: 0.5568627451, alpha: 1)
        label.numberOfLines = 0
        label.text = "iOS Developer \nSalt Lake City"
        label.font = UIFont.mainFontRegular(ofSize: 16)
        return label
    }()
    
    let locationImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    let badgedLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = #colorLiteral(red: 0.8274509804, green: 0.8235294118, blue: 0.8274509804, alpha: 1)
        label.textColor = .white
        label.text = "Badged"
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.semibold)
        label.clipsToBounds = true
        label.textAlignment = .center
        label.layer.cornerRadius = 10
        return label
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
        addSubview(studentNameLabel)
        addSubview(cityAndCourseLabel)
        addSubview(badgedLabel)
        
        profilePictureImageView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 1, paddingLeft: 18, paddingBottom: 0, paddingRight: 0, width: 150, height: 150)
        studentNameLabel.anchor(top: profilePictureImageView.topAnchor, left: profilePictureImageView.rightAnchor, bottom: nil, right: rightAnchor, paddingTop: 30, paddingLeft: 26, paddingBottom: 0, paddingRight: 8, width: 0, height: 0)
        cityAndCourseLabel.anchor(top: studentNameLabel.bottomAnchor, left: profilePictureImageView.rightAnchor, bottom: nil, right: rightAnchor, paddingTop: 7, paddingLeft: 26, paddingBottom: 0, paddingRight: 8, width: 0, height: 0)
        badgedLabel.anchor(top: cityAndCourseLabel.bottomAnchor, left: profilePictureImageView.rightAnchor, bottom: nil, right: nil, paddingTop: 25, paddingLeft: 40, paddingBottom: 0, paddingRight: 0, width: 80, height: 0)
        
    }
    
}
