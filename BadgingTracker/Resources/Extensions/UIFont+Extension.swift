//
//  UIFont+Extension.swift
//  BadgingTracker
//
//  Created by Jayden Garrick on 6/27/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import UIKit

extension UIFont {
    
    static func mainFontRegular(ofSize: CGFloat) -> UIFont {
        guard let font = UIFont(name: "SFProText-Regular", size: ofSize) else { fatalError("Couldn't find regular font") }
        return font
    }
    
    static func mainFontSemiBold(ofSize: CGFloat) -> UIFont {
        guard let font = UIFont(name: "SFProText-Semibold", size: ofSize) else { fatalError("Couldn't find font") }
        return font

    }

    static func mainFontBold(ofSize: CGFloat) -> UIFont {
        guard let font = UIFont(name: "SFProText-Bold", size: ofSize) else { fatalError("Couldn't find font") }
        return font
    }

    static func mainFontMedium(ofSize: CGFloat) -> UIFont {
        guard let font = UIFont(name: "SFProText-Medium", size: ofSize) else { fatalError("Couldn't find font") }
        return font
    }

}
