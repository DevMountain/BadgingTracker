//
//  SignUpPageViewController.swift
//  BadgingTracker
//
//  Created by Thao Doan on 6/30/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import UIKit

class SignUpPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpTextField()
        setUpLoginButton()
        setUpBottomDescription()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Full Name"
        textField.borderStyle = .none
        textField.backgroundColor = .clear
        textField.font = UIFont.systemFont(ofSize: 15)
        
        return textField
    }()
    
    let cohortTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Cohort"
        textField.borderStyle = .none
        textField.backgroundColor = .clear
        textField.font = UIFont.systemFont(ofSize: 15)
        
        return textField
    }()

    let emailTextFiled: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.borderStyle = .none
        textField.backgroundColor = .clear
        textField.font = UIFont.systemFont(ofSize: 15)
        return textField
    }()
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.borderStyle = .none
        textField.backgroundColor = .clear
        textField.font = UIFont.systemFont(ofSize: 15)
        
        return textField
    }()
    let signUpButton : UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .clear
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 5
        return button
    }()
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        let attriButedText = NSMutableAttributedString(string: "Already have an account ?", attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 12), NSAttributedStringKey.foregroundColor: UIColor.black])
        textView.attributedText = attriButedText
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    let loginButton : UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .clear
        button.setTitle("Login ", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        return button
    }()
    
    fileprivate func setUpTextField() {
        let stackView = UIStackView(arrangedSubviews: [nameTextField,cohortTextField,emailTextFiled,passwordTextField])
        view.addSubview(stackView)
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 186, paddingLeft: 50, paddingBottom: 0, paddingRight: 50, width: 0, height: 240)
}
   fileprivate func setUpLoginButton() {
        view.addSubview(signUpButton)
        signUpButton.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 88, paddingBottom: 129, paddingRight: 88, width: 0, height: 44)
    }
    fileprivate func setUpBottomDescription() {
        let stackView = UIStackView(arrangedSubviews:
            [descriptionTextView,loginButton])
        view.addSubview(stackView)
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 85, paddingBottom: 49, paddingRight: 85, width: 205, height: 0)
    }
}


