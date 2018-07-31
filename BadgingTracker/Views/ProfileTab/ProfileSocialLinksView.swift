//
//  SocialLinksView.swift
//  BadgingTracker
//
//  Created by Jayden Garrick on 7/31/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import UIKit

class ProfileSocialLinksView: UIView {
    // MARK: - UIElements
    let socialLinksLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
        label.font = UIFont.mainFontSemiBold(ofSize: 16)
        label.text = "Social Links"
        return label
    }()
    
    // FIXME: - Make these dynamic based on users social media accounts
    let linkedInButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(#imageLiteral(resourceName: "xcaLinkedIn"), for: .normal)
        return button
    }()
    
    let gitHubButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(#imageLiteral(resourceName: "xcaGithub"), for: .normal)
        return button
    }()
    
    let twitterButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(#imageLiteral(resourceName: "xcaTwitter"), for: .normal)
        return button
    }()
    
    let expandSocialMediaButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(#imageLiteral(resourceName: "xcaMoreSM"), for: .normal)
        return button
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
    
    // MARK: - Setup
    func setConstraints() {
        addSubview(socialLinksLabel)
        
        let stackView = UIStackView(arrangedSubviews: [linkedInButton, gitHubButton, twitterButton, expandSocialMediaButton])
        stackView.alignment = .firstBaseline
        stackView.spacing = 10
        stackView.axis = .horizontal
        addSubview(stackView)
        
        socialLinksLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 15, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        stackView.anchor(top: socialLinksLabel.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 13, paddingLeft: 15, paddingBottom: 15, paddingRight: 0, width: 0, height: 35)
    }
}
















