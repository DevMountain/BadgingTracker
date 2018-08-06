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
        imageView.image = #imageLiteral(resourceName: "xcaTempDELETE")
        imageView.layer.cornerRadius = 150 / 2
        imageView.clipsToBounds = true
        imageView.backgroundColor = .lightGray
        return imageView
    }()
    
    let studentNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
        label.font = UIFont.mainFontMedium(ofSize: 18)
        label.text = "Jayden Garrick"
        return label
    }()
    
    let courseLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.mainFontRegular(ofSize: 18)
        label.textColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
        label.text = "iOS Mentor"
        return label
    }()
    
    let cityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.mainFontRegular(ofSize: 13)
        label.textColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
        label.text = "Salt Lake City, UT"
        return label
    }()
    
    let profilePictureBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9294117647, green: 0.9411764706, blue: 0.9568627451, alpha: 1)
        return view
    }()
    
    let smallSeperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.7882352941, green: 0.8156862745, blue: 0.8352941176, alpha: 1)
        return view
    }()
    var user: User!
    
    // MARK: - Initialization
    convenience init(user: User) {
        self.init()
        self.user = user
        reloadViews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    func reloadViews() {
        profilePictureImageView.image = user.profilePhotoImage
        studentNameLabel.text = user.name
        courseLabel.text = user.title
        cityLabel.text = user.currentLocation
        self.setNeedsLayout()
    }
    
    func setConstraints() {
        backgroundColor = .white
        let stackView = UIStackView(arrangedSubviews: [studentNameLabel, courseLabel, cityLabel])
        stackView.alignment = .center
        stackView.spacing = 8
        stackView.axis = .vertical
        addSubview(profilePictureBackgroundView)
        addSubview(profilePictureImageView)
        addSubview(stackView)
        addSubview(smallSeperatorView)
        profilePictureBackgroundView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 130)
        profilePictureImageView.anchor(top: topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 60, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 150, height: 150)
        profilePictureImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        stackView.anchor(top: profilePictureImageView.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 8, paddingBottom: 8,  paddingRight: 8, width: 0, height: 0)
        stackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        smallSeperatorView.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1)
    }
    
}
