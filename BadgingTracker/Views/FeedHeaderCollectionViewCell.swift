//
//  FeedHeaderCollectionViewCell.swift
//  BadgingTracker
//
//  Created by Jayden Garrick on 7/5/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import UIKit

class FeedHeaderCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 3
        view.layer.masksToBounds = false
        view.layer.borderWidth = 1
        view.layer.borderColor = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1).cgColor
        return view
    }()
    
    let createPostLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.mainFontRegular(ofSize: 16)
        label.text = "Create post"
        label.textColor = #colorLiteral(red: 0.5764705882, green: 0.5764705882, blue: 0.5764705882, alpha: 1)
        return label
    }()
    
    let seperator: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.5764705882, green: 0.5764705882, blue: 0.5764705882, alpha: 1)
        return view
    }()
    
    let thinSeperator: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.5764705882, green: 0.5764705882, blue: 0.5764705882, alpha: 1)
        return view
    }()
    
    let mentorImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.layer.cornerRadius = 35 / 2
        imageView.backgroundColor = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
        return imageView
    }()
    
    let postTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Type post here..."
        textField.font = UIFont.mainFontRegular(ofSize: 16)
        return textField
    }()
    
    // MARK: - Initialization
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.translatesAutoresizingMaskIntoConstraints = false
    }
    
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
        backgroundColor = .clear
    }
    
    func setupConstraints() {
        addSubview(containerView)
        containerView.addSubview(createPostLabel)
        containerView.addSubview(seperator)
        containerView.addSubview(mentorImageView)
        containerView.addSubview(postTextField)
        containerView.addSubview(thinSeperator)
        
        containerView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 10, paddingRight: 10, width: 0, height: 0)
        createPostLabel.anchor(top: containerView.topAnchor, left: containerView.leftAnchor, bottom: nil, right: nil, paddingTop: 9, paddingLeft: 15, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        seperator.anchor(top: createPostLabel.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: createPostLabel.rightAnchor, paddingTop: 6, paddingLeft: 15, paddingBottom: 0, paddingRight: 0, width: 0, height: 2)
        mentorImageView.anchor(top: seperator.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: nil, paddingTop: 14, paddingLeft: 19, paddingBottom: 0, paddingRight: 0, width: 35, height: 35)
        postTextField.anchor(top: seperator.bottomAnchor, left: mentorImageView.rightAnchor, bottom: nil, right: containerView.rightAnchor, paddingTop: 22, paddingLeft: 10, paddingBottom: 0, paddingRight: 8, width: 0, height: 0)
        thinSeperator.anchor(top: seperator.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: containerView.rightAnchor, paddingTop: -1.5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0.35)
    }
    
}
