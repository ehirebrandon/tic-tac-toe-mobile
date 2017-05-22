//
//  Extensions.swift
//  NeverToes
//
//  Created by Brandon Lai on 5/6/17.
//  Copyright © 2017 Brandon Lai. All rights reserved.
//

import Foundation
import UIKit


//As of 5/22/2017 this extension has not been used anymore
//Extension still valid and still exist for purpose of reference.

extension UIImage{
    func dim(by: CGFloat) -> UIImage{
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 62, height: 60), false, 1)
        draw(at: CGPoint.zero, blendMode: .normal, alpha: by)
        let dimImage = UIGraphicsGetImageFromCurrentImageContext()
        return dimImage!
    }
}
