//
//  ProfileViewController.swift
//  BadgingTracker
//
//  Created by Jayden Garrick on 6/25/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // MARK: - Properties
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.bounces = false
        return scrollView
    }()
    
    var headerView = ProfileHeaderView()
    var courseView = ProfileCourseAndAboutView()
    var socialMediaLinkView = ProfileSocialLinksView()
    var containerViewForAssessments = ContainerViewForAssessments()
    var user: User? {
        didSet {
            if let user = self.user {
                self.headerView = ProfileHeaderView(user: user)
                self.courseView = ProfileCourseAndAboutView(user: user)
                self.socialMediaLinkView = ProfileSocialLinksView(user: user)
                self.containerViewForAssessments = ContainerViewForAssessments(user: user)
            }
        }
    }
    
    // MARK: - ViewLifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.9294117647, green: 0.9411764706, blue: 0.9568627451, alpha: 1)
        scrollView.contentSize = CGSize(width: view.frame.width, height: 2000)
        setConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.titleView = nil
        makeNavigationBarClear()
        setupNavBar()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        setDefaultNavigationBar()
    }
    
    // MARK: - Setup
    func setConstraints() {
        // Setup scrollview
        view.addSubview(scrollView)
        scrollView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        // Setup scrollview subviews
        scrollView.addSubview(headerView)
        scrollView.addSubview(courseView)
        scrollView.addSubview(socialMediaLinkView)
        scrollView.addSubview(containerViewForAssessments)
        
        // Constraints
        headerView.anchor(top: scrollView.topAnchor, left: scrollView.leftAnchor, bottom: nil, right: scrollView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: view.frame.width, height: 330)
        courseView.anchor(top: headerView.bottomAnchor, left: scrollView.leftAnchor, bottom: nil, right: headerView.rightAnchor, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: view.frame.width, height: 209)
        socialMediaLinkView.anchor(top: courseView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 5, paddingLeft: 0, paddingBottom: 5, paddingRight: 0, width: view.frame.width, height: 94)
        containerViewForAssessments.anchor(top: socialMediaLinkView.bottomAnchor, left: view.leftAnchor, bottom: scrollView.bottomAnchor, right: view.rightAnchor, paddingTop: 5, paddingLeft: 0, paddingBottom: 8, paddingRight: 0, width: view.frame.width, height: 273)
        let collectionViewForAssessments = AssessmentsCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        addChildViewController(collectionViewForAssessments)
        containerViewForAssessments.containerViewForCollectionView.addSubview(collectionViewForAssessments.view)
    }
    
    func setupNavBar() {
        // FIXME: Commented out this edit button for the demo.
        if false {
            let editButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.edit, target: self, action: #selector(editButtonTapped))
            editButton.tintColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
            navigationController?.navigationItem.rightBarButtonItem = editButton
            navigationItem.rightBarButtonItem = editButton
        }
    }
    
    // MARK: - Action Functions / Selectors
    @objc func editButtonTapped() {
        // FIXME: - Add Implementation
        print("Edit Button Tapped")
    }
    
}



