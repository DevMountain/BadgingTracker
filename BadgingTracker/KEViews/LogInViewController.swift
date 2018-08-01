//
//  LogInViewController.swift
//  BadgingTracker
//
//  Created by Thao Doan on 6/29/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import UIKit
import Firebase

class LogInViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLoginButtons()
        setUpContraints()
    }
    let loginWithGithub : UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0.7803921569, green: 0.7803921569, blue: 0.7803921569, alpha: 1)
        button.setTitle("Log In With GitHub", for: .normal)
        button.tintColor = UIColor.white
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 5
        return button
    }()
    let loginWithLinkedln : UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0.6078431373, green: 0.6078431373, blue: 0.6078431373, alpha: 1)
        button.setTitle("Log in With Linkedln", for: .normal)
        button.tintColor = UIColor.white
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 5
        return button
    }()
    let login : UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .clear
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(loginSegue), for: .touchUpInside)
        return button
    }()
    let orTextLabel: UILabel = {
        var label = UILabel()
        label.text = "OR"
        label.textColor = UIColor.lightGray
        label.textAlignment = .center
        return label
    }()
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        let attriButedText = NSMutableAttributedString(string: "By logging in, you agree to DevMountain's", attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 15), NSAttributedStringKey.foregroundColor: UIColor.black])
        attriButedText.append(NSMutableAttributedString(string: "\n Terms of Service", attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 14), NSAttributedStringKey.foregroundColor: UIColor.gray]))
        attriButedText.append(NSMutableAttributedString(string: " and ", attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 14), NSAttributedStringKey.foregroundColor:UIColor.black]))
        attriButedText.append(NSMutableAttributedString(string: " Privacy Policy ", attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 14),NSAttributedStringKey.foregroundColor: UIColor.gray]))
        textView.attributedText = attriButedText
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    var stackView: UIStackView = {
        var stackView = UIStackView()
        return stackView
    }()
    
    fileprivate func setupLoginButtons() {
        stackView = UIStackView(arrangedSubviews: [loginWithGithub, loginWithLinkedln])
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 29
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        stackView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 203, paddingLeft: 61, paddingBottom: 0, paddingRight: 61, width: 0, height: 130)
    }
    fileprivate func setUpContraints() {
        view.addSubview(login)
        view.addSubview(descriptionTextView)
        view.addSubview(orTextLabel)
        login.anchor(top: orTextLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 30, paddingLeft: 62, paddingBottom: 0, paddingRight: 61, width: 0, height: 51)
        orTextLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        orTextLabel.anchor(top: stackView.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 0 , paddingBottom: 0, paddingRight: 0, width: 30, height: 18)
        descriptionTextView.anchor(top: login.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 140, paddingLeft: 50, paddingBottom: 0, paddingRight: 50, width: 0, height: 0)
    }
    @objc func loginSegue(){
        let page = LogInPageViewController()
        present(page, animated: true, completion: nil)
    }
    
}
