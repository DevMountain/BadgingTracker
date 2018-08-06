//
//  SettingsTableViewCell.swift
//  BadgingTracker
//
//  Created by Jayden Garrick on 8/1/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.mainFontRegular(ofSize: 16)
        label.textColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        label.text = "Yo yo yo"
        return label
    }()
    
    var cellSwitch: UISwitch? = {
        let switch1 = UISwitch()
        switch1.onTintColor = #colorLiteral(red: 0.1647058824, green: 0.6705882353, blue: 0.8862745098, alpha: 1)
        return switch1
        }() {
        didSet {
            setConstraints()
            setNeedsDisplay()
        }
    }
    
    let seperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.831372549, green: 0.8509803922, blue: 0.8666666667, alpha: 1)
        return view
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
    
    // MARK: - Setup
    func setConstraints() {
        // AddSubview
        addSubview(titleLabel)
        addSubview(cellSwitch ?? UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0)))
        addSubview(seperatorView)
        
        // Constrain
        titleLabel.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 28, paddingLeft: 20, paddingBottom: 28, paddingRight: 0, width: 0, height: 0)
        cellSwitch?.anchor(top: topAnchor, left: nil, bottom: bottomAnchor, right: rightAnchor, paddingTop: 23, paddingLeft: 0, paddingBottom: 23, paddingRight: 20, width: 0, height: 0)
        seperatorView.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 15, paddingBottom: 0, paddingRight: 15, width: 0, height: 1)
    }
}
