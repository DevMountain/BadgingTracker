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
    // UI
    var feedPost: FeedPost? {
        didSet {
            self.setupViews()
        }
    }
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 43 / 2
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Jayden Garrick"
        label.font = UIFont.mainFontRegular(ofSize: 16)
        return label
    }()
    
    let optionsButton: UIButton = {
        let button = UIButton(type: UIButtonType.system)
        button.setAttributedTitle(NSAttributedString(string: "●●●", attributes: [
            NSAttributedStringKey.font : UIFont.mainFontRegular(ofSize: 18)
            ]), for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1), for: .normal)
        button.tintColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
        button.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2.0)
        return button
    }()
    
    let postTypeLabel: UILabel = {
        let label = UILabel()
        let attributedString = NSMutableAttributedString(string: "8 min", attributes: [
            NSAttributedStringKey.font : UIFont.mainFontRegular(ofSize: 12),
            NSAttributedStringKey.foregroundColor : #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)

            ])
        attributedString.append(NSAttributedString(string: " • ", attributes: [
            NSAttributedStringKey.font : UIFont.systemFont(ofSize: 8),
            NSAttributedStringKey.foregroundColor : #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
            ]))
        attributedString.append(NSAttributedString(string: "Private", attributes: [
            NSAttributedStringKey.font : UIFont.mainFontRegular(ofSize: 12),
            NSAttributedStringKey.foregroundColor : #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
            ]))
        label.attributedText = attributedString
        return label
    }()
    
    let bodyTextLabel: UILabel = {
        let label = UILabel()
        label.text = "Your assessment three has been graded by Jay$Money. You scored a 90%."
        label.font = UIFont.mainFontRegular(ofSize: 16)
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    let likesTotalLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.mainFontRegular(ofSize: 14)
        label.text = "2 likes"
        label.textColor = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
        return label
    }()
    
    let seperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
        return view
    }()
    
    var calculatedHeight: CGFloat {
        return profileImageView.frame.height +
               bodyTextLabel.frame.height +
               likeButton.frame.height +
               seperatorView.frame.height +
               likesTotalLabel.frame.height
    }
    
    var likeButton: UIButton = {
        let button = UIButton(type: UIButtonType.system)
        let image = UIImage(named: "heartEmpty")!
        button.setImage(image.withRenderingMode(.alwaysOriginal), for: .normal)
        button.setAttributedTitle(NSAttributedString(string: " Like", attributes: [
            NSAttributedStringKey.font : UIFont.mainFontRegular(ofSize:12)
            ]), for: .normal)
        button.addTarget(self, action: #selector(likeButtonPressed), for: .touchUpInside)
        button.tintColor = #colorLiteral(red: 0.6745098039, green: 0.6745098039, blue: 0.6745098039, alpha: 1)
        return button
    }()
    
    // MARK: - Init
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupCell()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func likeButtonPressed() {
        guard let feedPost = feedPost else {
            return
        }
        feedPost.hasBeenLiked = !feedPost.hasBeenLiked
        setupLikeButton()
    }
    
    func setupLikeButton() {
        guard let feedPost = feedPost else {
            return
        }
        likeButton.setAttributedTitle(NSAttributedString(string: feedPost.hasBeenLiked ? " Liked" : " Like", attributes: [
            NSAttributedStringKey.font : UIFont.mainFontRegular(ofSize:12)
            ]), for: .normal)
        let heartImage = feedPost.hasBeenLiked ? UIImage(named: "heartFilled")! : UIImage(named: "heartEmpty")!
        likeButton.setImage(heartImage.withRenderingMode(.alwaysOriginal), for: .normal)
    }
    
    // MARK: - Setup
    private func setupViews() {
        guard let feedPost = feedPost else {
            return
        }
        self.nameLabel.text = feedPost.senderName
        let attributedString = NSMutableAttributedString(string: feedPost.timeSince, attributes: [
            NSAttributedStringKey.font : UIFont.mainFontRegular(ofSize: 12),
            NSAttributedStringKey.foregroundColor : #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
            
            ])
        attributedString.append(NSAttributedString(string: " • ", attributes: [
            NSAttributedStringKey.font : UIFont.systemFont(ofSize: 8),
            NSAttributedStringKey.foregroundColor : #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
            ]))
        attributedString.append(NSAttributedString(string: feedPost.isPrivateText, attributes: [
            NSAttributedStringKey.font : UIFont.mainFontRegular(ofSize: 12),
            NSAttributedStringKey.foregroundColor : #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
            ]))
        self.postTypeLabel.attributedText = attributedString
        self.bodyTextLabel.text = feedPost.text
        self.bodyTextLabel.sizeToFit()
        self.likesTotalLabel.text = "\(feedPost.likesText) likes"
        self.setupLikeButton()
        self.profileImageView.image = feedPost.senderImage
    }
    
    private func setupCell() {
        layer.cornerRadius = 3
        layer.masksToBounds = false
//        layer.shadowColor = UIColor.black.withAlphaComponent(0.5).cgColor
//        layer.shadowOffset = CGSize(width: 0, height: 0)
//        layer.shadowOpacity = 0.8
        layer.borderWidth = 1
        layer.borderColor = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1).cgColor
    }
    
    // MARK: - Constraints
    private func setupConstraints() {
        addSubview(profileImageView)
        addSubview(nameLabel)
        addSubview(optionsButton)
        addSubview(postTypeLabel)
        addSubview(bodyTextLabel)
        addSubview(likesTotalLabel)
        addSubview(seperatorView)
        addSubview(likeButton)
        profileImageView.anchor(top: topAnchor, left: leftAnchor, bottom: bodyTextLabel.topAnchor, right: nil, paddingTop: 11, paddingLeft: 11, paddingBottom: 11, paddingRight: 0, width: 43, height: 43)
        nameLabel.anchor(top: topAnchor, left: profileImageView.rightAnchor, bottom: nil, right: nil, paddingTop: 15, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        optionsButton.anchor(top: topAnchor, left: nil, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 20, height: 20)
        postTypeLabel.anchor(top: nameLabel.bottomAnchor, left: profileImageView.rightAnchor, bottom: nil, right: nil, paddingTop: 2, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        bodyTextLabel.anchor(top: nil, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 11, paddingLeft: 15, paddingBottom: 0, paddingRight: 15, width: 0, height: 0)
        likesTotalLabel.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 15, paddingBottom: 11, paddingRight: 0, width: 0, height: 0)
        seperatorView.anchor(top: nil, left: leftAnchor, bottom: likesTotalLabel.topAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 15, paddingBottom: 10, paddingRight: 15, width: 0, height: 1)
        likeButton.anchor(top: nil, left: leftAnchor, bottom: seperatorView.topAnchor, right: nil, paddingTop: 0, paddingLeft: 20, paddingBottom: 18, paddingRight: 0, width: 0, height: 0)
    }
    
}
