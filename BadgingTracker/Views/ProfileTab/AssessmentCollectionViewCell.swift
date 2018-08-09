//
//  AssessmentCollectionViewCell.swift
//  BadgingTracker
//
//  Created by Jayden Garrick on 7/31/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import UIKit

class AssessmentCollectionViewCell: UICollectionViewCell {
    // MARK: - Properties
    let assessmentNumberAndTitleLabel: UILabel = {
        let label = UILabel()
        let attributedText = NSMutableAttributedString(string: "Core Data", attributes: [
            NSAttributedStringKey.font: UIFont.mainFontRegular(ofSize: 16),
            NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
            ])
        
        // Small Linebreak for spacing
        attributedText.append(NSAttributedString(string: "\n", attributes: [
            NSAttributedStringKey.font : UIFont.systemFont(ofSize: 10)
            ]))
        
        // FIXME: - Make the course have a proper description based on the user's course
        attributedText.append(NSAttributedString(string: "Assessment 2", attributes: [
            NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.4705882353, green: 0.4862745098, blue: 0.5019607843, alpha: 1),
            NSAttributedStringKey.font: UIFont.mainFontRegular(ofSize: 13)
            ]))
        label.attributedText = attributedText
        return label
    }()
    
    let seperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.7882352941, green: 0.8156862745, blue: 0.8352941176, alpha: 1)
        return view
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        // FIXME: - Make the course have a proper description based on the user's course
        label.text = "ManagedObjectContext, NSPersistentContainer, CRUD Functions with CoreData, FetchResultsController, Delegate Pattern, CustomCells, Protocols"
        label.font = UIFont.mainFontRegular(ofSize: 16)
        return label
    }()
    
    let passLabel: UILabel = {
        let label = UILabel()
        // FIXME: - Make the course have a proper description based on the user's course
        label.text = "Pass"
        label.textAlignment = .center
        label.font = UIFont.mainFontRegular(ofSize: 16)
        label.textColor = #colorLiteral(red: 0.1647058824, green: 0.6705882353, blue: 0.8862745098, alpha: 1)
        label.backgroundColor = #colorLiteral(red: 0.8745098039, green: 0.9529411765, blue: 0.9843137255, alpha: 1)
        label.layer.cornerRadius = 3
        label.layer.borderWidth = 1
        label.layer.borderColor = #colorLiteral(red: 0.1647058824, green: 0.6705882353, blue: 0.8862745098, alpha: 1)
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "06/15/2018"
        label.font = UIFont.mainFontRegular(ofSize: 13)
        label.textColor = #colorLiteral(red: 0.5058823529, green: 0.5176470588, blue: 0.5333333333, alpha: 1)
        return label
    }()

    
    // MARK: - Initialization
    override func awakeFromNib() {
        super.awakeFromNib()
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
        
        self.setNeedsLayout()
    }
    
    func setConstraints() {
        // Setup Cell
        layer.cornerRadius = 5
        layer.borderWidth = 1
        layer.borderColor = #colorLiteral(red: 0.7882352941, green: 0.8156862745, blue: 0.8352941176, alpha: 1)

        
        // Adding Subview
        addSubview(assessmentNumberAndTitleLabel)
        addSubview(seperatorView)
        addSubview(descriptionLabel)
        addSubview(passLabel)
        addSubview(dateLabel)
        
        // Constraints
        assessmentNumberAndTitleLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 13, paddingLeft: 17, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        seperatorView.anchor(top: assessmentNumberAndTitleLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 13, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1)
        descriptionLabel.anchor(top: seperatorView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 13, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 0)
        passLabel.anchor(top: descriptionLabel.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 13, paddingLeft: 17, paddingBottom: 19, paddingRight: 0, width: 45, height: 20) //!!! Maybe give height
        dateLabel.anchor(top: nil, left: passLabel.rightAnchor, bottom: bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 8, paddingBottom: 19, paddingRight: 0, width: 0, height: 0)
    }
}









