//
//  UIView+Extension.swift
//  Museum
//
//  Created by Naste, Ishwar (US - Bengaluru) on 15/07/19.
//  Copyright © 2019 Naste, Ishwar (US - Bengaluru). All rights reserved.
//

import UIKit

extension UIView {
    
    /**
     Function to apply masked corners with radius
     
     - parameter corners: `CACornerMask`
     - parameter radius: `CGFloat`
     - parameter clipToBounds: A Boolean value that determines whether subviews are confined to the bounds of the view.
     */
    func roundCorners(_ corners: CACornerMask, radius: CGFloat, clipToBounds: Bool = true) {
        clipsToBounds = clipToBounds
        layer.cornerRadius = radius
        layer.maskedCorners = corners
    }
    
    /**
     Function to apply dropShadow
     
     - parameter opacity: opacity of the shadow
     - parameter radius: shadow radius
     - parameter color: shadow color
     - parameter offset: shadow offset
     */
    
    func applyShadow(withOpacity opacity: Float, color: UIColor, offset: CGSize, andRadius radius: CGFloat) {
        layer.shadowOffset  = offset
        layer.shadowOpacity = opacity
        layer.shadowRadius  = radius
        layer.shadowColor   = color.cgColor
    }
}
