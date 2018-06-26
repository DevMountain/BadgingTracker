//
//  FeedCollectionViewCell.swift
//  BadgingTracker
//
//  Created by Jayden Garrick on 6/26/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import UIKit

class FeedCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = UIColor(white: 0.9, alpha: 1)
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 25
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "JayBooty Garrick"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let optionsButton: UIButton = {
        let button = UIButton()
        button.setTitle("•••", for: .normal)
        button.setTitleColor(UIColor(white: 0.75, alpha: 1), for: .normal)
        button.tintColor = UIColor(white: 0.9, alpha: 1)
        return button
    }()
    
    let postTypeLabel: UILabel = {
        let label = UILabel()
        let attributedString = NSMutableAttributedString(string: "8 min", attributes: [
            NSAttributedStringKey.font : UIFont.systemFont(ofSize: 14),
            NSAttributedStringKey.foregroundColor : UIColor(white: 0.8, alpha: 1)
            ])
        attributedString.append(NSAttributedString(string: " • ", attributes: [
            NSAttributedStringKey.font : UIFont.systemFont(ofSize: 10),
            NSAttributedStringKey.foregroundColor : UIColor(white: 0.8, alpha: 1)
            ]))
        attributedString.append(NSAttributedString(string: "Private", attributes: [
            NSAttributedStringKey.font : UIFont.systemFont(ofSize: 14),
            NSAttributedStringKey.foregroundColor : UIColor(white: 0.8, alpha: 1)
            ]))
        label.attributedText = attributedString
//        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    func setupCell() {
        layer.cornerRadius = 3
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.withAlphaComponent(0.5).cgColor
        layer.shadowOffset = CGSize(width: 0.25, height: 0.25)
        layer.shadowOpacity = 0.8
        layer.borderWidth = 0.5
        layer.borderColor = UIColor(white: 75, alpha: 1).cgColor
    }
    
    // MARK: - Constraints
    func setupConstraints() {
        addSubview(profileImageView)
        addSubview(nameLabel)
        addSubview(optionsButton)
        addSubview(postTypeLabel)
        profileImageView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 11, paddingLeft: 11, paddingBottom: 0, paddingRight: 0, width: 50, height: 50)
        nameLabel.anchor(top: topAnchor, left: profileImageView.rightAnchor, bottom: nil, right: nil, paddingTop: 15, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        optionsButton.anchor(top: topAnchor, left: nil, bottom: nil, right: rightAnchor, paddingTop: 7, paddingLeft: 0, paddingBottom: 0, paddingRight: 11, width: 22, height: 22)
        postTypeLabel.anchor(top: nameLabel.bottomAnchor, left: profileImageView.rightAnchor, bottom: nil, right: nil, paddingTop: 2, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
    }
    
    
}
