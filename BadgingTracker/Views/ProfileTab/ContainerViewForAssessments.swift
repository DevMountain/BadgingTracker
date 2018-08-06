//
//  ContainerViewForAssessments.swift
//  BadgingTracker
//
//  Created by Jayden Garrick on 7/31/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import UIKit

class ContainerViewForAssessments: UIView {
    // MARK: - Properties
    let assessmentLabel: UILabel = {
        let label = UILabel()
        label.text = "Assessments"
        label.font = UIFont.mainFontSemiBold(ofSize: 16)
        label.textColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
        return label
    }()
    
    var containerViewForCollectionView: UIView = {
       let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    var user: User!
    
    // MARK: - Initialization
    convenience init(user: User) {
        self.init()
        self.user = user
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
    func reloadViews() {
        
        self.setNeedsLayout()
    }
    
    func setConstraints() {
        // Add Subview
        addSubview(assessmentLabel)
        addSubview(containerViewForCollectionView)
        
        // Constraints
        assessmentLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 15.8, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        containerViewForCollectionView.anchor(top: assessmentLabel.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 23.2, paddingLeft: 0, paddingBottom: 30, paddingRight: 0, width: 0, height: 0)
    }
}
