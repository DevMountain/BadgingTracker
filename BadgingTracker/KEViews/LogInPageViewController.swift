//
//  LogInPageViewController.swift
//  BadgingTracker
//
//  Created by Thao Doan on 6/29/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import UIKit
import Firebase

class LogInPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupTextFields()
        setUpContraints()
    }
    override func viewDidLayoutSubviews() {
        let lineColor = UIColor.lightGray
        self.emailTextFiled.setBottomLine(borderColor: lineColor)
        self.passwordTextField.setBottomLine(borderColor: lineColor)
    }
    let logInButton : UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .clear
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        return button
    }()
    let forgotPasswordButton : UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .clear
        button.setTitle("Forgot password?", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        return button
    }()
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.borderStyle = .none
        textField.backgroundColor = .clear
        textField.font = UIFont.systemFont(ofSize: 14)
        
        return textField
    }()
    let emailTextFiled: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.borderStyle = .none
        textField.backgroundColor = .clear
        textField.font = UIFont.systemFont(ofSize: 14)
        return textField
    }()
    let logoImage : UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "logo"))
        image.contentMode = .scaleAspectFit
        return image
    }()
    var stackView: UIStackView = {
        var stackView = UIStackView()
        return stackView
    }()
    fileprivate func setupTextFields() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView = UIStackView(arrangedSubviews: [emailTextFiled,passwordTextField])
        view.addSubview(stackView)
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 300, paddingLeft: 35, paddingBottom: 0, paddingRight: 65, width: 0, height: 120)
    }
    func setUpContraints() {
        view.addSubview(logInButton)
        view.addSubview(logoImage)
        view.addSubview(forgotPasswordButton)
        logInButton.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 494, paddingLeft: 78, paddingBottom: 0, paddingRight: 78, width: 0, height: 44)
        forgotPasswordButton.anchor(top: view.topAnchor, left: view.leftAnchor , bottom: nil, right: view.rightAnchor, paddingTop: 440, paddingLeft: 205, paddingBottom: 0, paddingRight: 56.8, width: 0, height: 18)
        logoImage.anchor(top: nil , left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 142, paddingBottom: 420, paddingRight: 142, width: 0, height: 0)
        
    }
    @objc func handleSignUp() {
        guard let email = emailTextFiled.text, !email.isEmpty,
            let password = passwordTextField.text, !password.isEmpty else {
                let alertController = UIAlertController(title: "Login Error", message: "Please make sure you provide your name, email address and password to complete the registration.", preferredStyle: .alert)
                let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(okayAction)
                present(alertController, animated: true, completion: nil)
                
                return}
        AuthenticationController.shared.createUser(email: email, password: password) { (success) in
            if success {
                self.view.endEditing(true)
            }
<<<<<<< HEAD
        }
=======
            self.view.endEditing(true)
            let mainTabBarController = MainTabBarController()
            UserController.shared.loggedInUser = UserController.shared.student10
            self.present(mainTabBarController, animated: true)
       }
>>>>>>> 0463b1154ae93b115d1415d3cc17c9da81d545df
    }
}

extension UITextField {
    func setBottomLine (borderColor: UIColor){
        self.borderStyle = UITextBorderStyle.none
        self.backgroundColor = UIColor.clear
        let borderLine = UIView()
        let height = 1.0
        borderLine.frame = CGRect(x: 0, y: Double(self.frame.height) - height, width: Double(self.frame.width), height: height)
        borderLine.backgroundColor = borderColor
        self.addSubview(borderLine)
    }
}
