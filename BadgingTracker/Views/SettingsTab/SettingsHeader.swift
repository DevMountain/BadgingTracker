//
//  SettingsHeader.swift
//  BadgingTracker
//
//  Created by Jayden Garrick on 8/1/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import UIKit

class SettingsHeader: UIView {
    // MARK: - Properties
    let userProfileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 80 / 2
        imageView.clipsToBounds = true
        imageView.image = #imageLiteral(resourceName: "xcaTempDELETE")
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .lightGray
        return imageView
    }()
    
    let nameAndDescriptionLabel: UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
        // FIXME: - Make name dynamic based on user
        let attributedText = NSMutableAttributedString(attributedString: NSAttributedString(string: "Jayden Garrick \n", attributes: [
            NSAttributedStringKey.font : UIFont.mainFontSemiBold(ofSize: 24),
            NSAttributedStringKey.foregroundColor : #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
            ]))
        
        attributedText.append(NSAttributedString(string: "\nEdit Profile", attributes: [
            NSAttributedStringKey.font : UIFont.mainFontRegular(ofSize: 14),
            NSAttributedStringKey.foregroundColor : #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
            ]))
        label.attributedText = attributedText
        return label
    }()

    // MARK: - Initialization
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
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
        // Add subview
        addSubview(userProfileImageView)
        addSubview(nameAndDescriptionLabel)
        
        // Constrain
        userProfileImageView.anchor(top: topAnchor, left: nil, bottom: nil, right: rightAnchor, paddingTop: 45, paddingLeft: 0, paddingBottom: 0, paddingRight: 21, width: 80, height: 80)
        nameAndDescriptionLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 50, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
}









