//
//  SearchUITableViewCell.swift
//  BadgingTracker
//
//  Created by Jayden Garrick on 7/5/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = #colorLiteral(red: 0.8274509804, green: 0.8235294118, blue: 0.8274509804, alpha: 1)
        imageView.layer.cornerRadius = 75 / 2
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.mainFontMedium(ofSize: 16)
        label.text = "Jayden Garrick"
        label.textColor = #colorLiteral(red: 0.2666666667, green: 0.2666666667, blue: 0.2666666667, alpha: 1)
        return label
    }()
    
    let cohortAndCityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.mainFontRegular(ofSize: 16)
        label.numberOfLines = 0
        label.text = "iOS16 Immersive \nSalt Lake City, Utah"
        label.textColor = #colorLiteral(red: 0.6470588235, green: 0.6470588235, blue: 0.6470588235, alpha: 1)
        return label

    }()
    
    // MARK: - Initialization
    override func awakeFromNib() {
        super.awakeFromNib()
        setConstraints()
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Functions
    func setConstraints() {
        addSubview(profileImageView)
        addSubview(nameLabel)
        addSubview(cohortAndCityLabel)
        
        profileImageView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 15, paddingBottom: 0, paddingRight: 0, width: 75, height: 75)
        nameLabel.anchor(top: topAnchor, left: profileImageView.rightAnchor, bottom: nil, right: rightAnchor, paddingTop: 27, paddingLeft: 16, paddingBottom: 0, paddingRight: 8, width: 0, height: 0)
        cohortAndCityLabel.anchor(top: nameLabel.bottomAnchor, left: profileImageView.rightAnchor, bottom: nil, right: rightAnchor, paddingTop: 1, paddingLeft: 16, paddingBottom: 8, paddingRight: 8, width: 0, height: 0)
        
    }

}





