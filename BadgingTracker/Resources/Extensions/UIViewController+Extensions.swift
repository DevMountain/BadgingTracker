//
//  UIViewController+Extensions.swift
//  BadgingTracker
//
//  Created by Jayden Garrick on 7/31/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import UIKit

extension UIViewController {
    
    
    /// Makes the navigation bar clear - as we need it clear on certain VC's
    func makeNavigationBarClear() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
//        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
    }
    
    
    /// Makes the navigation bar white with devmountain logo on it -> The default look
    func setDefaultNavigationBar() {
        navigationController?.navigationBar.barTintColor = UIColor.white
        let imageView = UIImageView(image: #imageLiteral(resourceName: "xcaDevLogo"))
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
    }
    
}
