//
//  UIColor+Extensions.swift
//  BadgingTracker
//
//  Created by Jayden Garrick on 6/25/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import UIKit

extension UIColor {
    static func rgb(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}
