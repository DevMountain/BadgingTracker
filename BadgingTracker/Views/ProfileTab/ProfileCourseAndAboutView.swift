//
//  ProfileCourseAndAboutView.swift
//  BadgingTracker
//
//  Created by Jayden Garrick on 7/31/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import UIKit

class ProfileCourseAndAboutView: UIView {
    
    // MARK: - UIElements
    let courseTitleAndDescriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        let attributedText = NSMutableAttributedString(string: "Course \n", attributes: [
            NSAttributedStringKey.font: UIFont.mainFontSemiBold(ofSize: 16),
            NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
            ])
        
        // Small Linebreak for spacing
        attributedText.append(NSAttributedString(string: "\n", attributes: [
            NSAttributedStringKey.font : UIFont.systemFont(ofSize: 10)
            ]))
        
        // FIXME: - Make the course have a proper description based on the user's course
        attributedText.append(NSAttributedString(string: "iOS Development", attributes: [
            NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1),
            NSAttributedStringKey.font: UIFont.mainFontRegular(ofSize: 15)
            ]))
        label.attributedText = attributedText
        return label
    }()
    
    // FIXME: - Make this change based on whether or not student graduated
    let certifiedGraduateLabel: UILabel = {
        let label = UILabel()
        label.text = "Certified Graduate"
        label.font = UIFont.mainFontRegular(ofSize: 15)
        label.textColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 5
        return label
    }()
    
    // FIXME: - Make this change based on whether or not student graduated
    let checkMarkForGraduateImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "xcaBadgeCheck")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let aboutLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        let attributedText = NSMutableAttributedString(string: "About \n", attributes: [
            NSAttributedStringKey.font: UIFont.mainFontSemiBold(ofSize: 16),
            NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
            ])
        
        // Small Linebreak for spacing
        attributedText.append(NSAttributedString(string: "\n", attributes: [
            NSAttributedStringKey.font : UIFont.systemFont(ofSize: 10)
            ]))
        
        // FIXME: - Make the course have a proper description based on the user's course
        attributedText.append(NSAttributedString(string: "I'm really into blockchain and emerging technologies. I am only looking for jobs where Karl is my boss!", attributes: [
            NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1),
            NSAttributedStringKey.font: UIFont.mainFontRegular(ofSize: 15)
            ]))
        label.attributedText = attributedText
        return label

    }()
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Functions
    func setConstraints() {
        addSubview(courseTitleAndDescriptionLabel)
        addSubview(certifiedGraduateLabel)
        addSubview(checkMarkForGraduateImageView)
        addSubview(aboutLabel)
        courseTitleAndDescriptionLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 15, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: frame.width / 2, height: 0)
        // FIXME: - CertifiedGLabel is not centered properly
        certifiedGraduateLabel.anchor(top: nil, left: nil, bottom: courseTitleAndDescriptionLabel.bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 10, paddingRight: 20, width: 0, height: 22)
        checkMarkForGraduateImageView.anchor(top: nil, left: courseTitleAndDescriptionLabel.rightAnchor, bottom: nil, right: certifiedGraduateLabel.leftAnchor, paddingTop: 0, paddingLeft: 11, paddingBottom: 0, paddingRight: 2, width: 22, height: 22)
        checkMarkForGraduateImageView.centerYAnchor.constraint(equalTo: certifiedGraduateLabel.centerYAnchor).isActive = true
        aboutLabel.anchor(top: courseTitleAndDescriptionLabel.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 19, paddingLeft: 20, paddingBottom: 8, paddingRight: 20, width: 0, height: 0)
    }
    
    
}
