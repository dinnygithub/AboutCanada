//
//  Theme.swift
//  AboutCanada
//
//  Created by Dinny Anand on 31/03/2020.
//  Copyright © 2020 Dinny Anand. All rights reserved.
//

import UIKit.UIFont

class Theme {
    
    class colors{
        class func acGreen()->UIColor {
            return UIColor(red: 14/255, green: 168/255, blue: 0, alpha: 1)
        }
        class func acWhite()->UIColor {
            return UIColor.white
        }
        class func acBlack()->UIColor {
            return UIColor.black
        }
    }
    
    class fonts {
        class func avenirLight(size: CGFloat) -> UIFont {
            return UIFont(name: "Avenir-Light", size: size)!
        }
        class func avenirMedium(size: CGFloat) -> UIFont {
            return UIFont(name: "Avenir-Medium", size: size)!
        }
    }
    
   
}
