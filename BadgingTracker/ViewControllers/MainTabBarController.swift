//
//  MainTabBarController.swift
//  BadgingTracker
//
//  Created by Jayden Garrick on 6/25/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    // MARK: - ViewLifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        setupViewControllers()
    }
    
    // MARK: - Setup
    /// Sets up the view controllers for the main tab bar
    fileprivate func setupViewControllers() {
        
        // Setting up the tab bar
        let feedViewController = navigationControllerWith(rootViewController: FeedViewController(collectionViewLayout: UICollectionViewFlowLayout()), unselectedImage: #imageLiteral(resourceName: "xcaTabBarPlaceHolder"), selectedImage: #imageLiteral(resourceName: "xcaTabBarPlaceHolder"), title: "Feed")
        let directoryViewController = navigationControllerWith(rootViewController: DirectoryViewController(), unselectedImage: #imageLiteral(resourceName: "xcaTabBarPlaceHolder"), selectedImage: #imageLiteral(resourceName: "xcaTabBarPlaceHolder"), title: "Directory")
        let profileViewController = navigationControllerWith(rootViewController: ProfileViewController(), unselectedImage: #imageLiteral(resourceName: "xcaTabBarPlaceHolder"), selectedImage: #imageLiteral(resourceName: "xcaTabBarPlaceHolder"), title: "Profile")
        let settingsViewController = navigationControllerWith(rootViewController: SettingsViewController(), unselectedImage: #imageLiteral(resourceName: "xcaTabBarPlaceHolder"), selectedImage: #imageLiteral(resourceName: "xcaTabBarPlaceHolder"), title: "Settings")
        tabBar.tintColor = .black
        viewControllers = [
            feedViewController,
            directoryViewController,
            profileViewController,
            settingsViewController]
    }
    
    /// Sets up a NavigationController with a root ViewController. Also sets the tab images for the MainTabBar
    ///
    /// - Parameters:
    ///   - rootViewController: The root ViewController for the navigation bar
    ///   - unselectedImage: Unselected image for tab bar
    ///   - selectedImage: Selected image for tab bar
    /// - Returns: Navigation Controller that is returned from the root ViewController
    fileprivate func navigationControllerWith(rootViewController: UIViewController?, unselectedImage: UIImage, selectedImage: UIImage, title: String) -> UINavigationController {
        var viewController: UIViewController
        if rootViewController == nil {
            viewController = UIViewController()
        } else {
            viewController = rootViewController!
        }
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.tabBarItem.image = unselectedImage
        navigationController.tabBarItem.selectedImage = selectedImage
        navigationController.tabBarItem.title = title
        
        return navigationController
    }

}


