//
//  UIColorExtension.swift
//  Rapunzel
//
//  Created by tunay alver on 1.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

extension UIColor {
    
    //MARK: - Hex
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
    
    /// Light mode color is White. Dark mode color is Black
    static var primaryBackground: UIColor{
        if #available(iOS 13, *) {
            return UIColor(named: "primaryBackground")!
        }
        return UIColor(rgb: 0xFFFFFF)
    }
    
    /// Light mode color is Dark Blue. Dark mode color is Dark Blue.
    static var appPaletteFirst: UIColor {
        if #available(iOS 13, *) {
            return UIColor(named: "appPaletteFirst")!
        }
        return UIColor(rgb: 0x0A121F)
    }

    /// Light mode color is Blue. Dark mode color is Blue.
    static var appPaletteSecond: UIColor {
        if #available(iOS 13, *) {
            return UIColor(named: "appPaletteSecond")!
        }
        return UIColor(rgb: 0x0064FF)
    }

    /// Light mode color is Dark Grey. Dark mode color is Dark Grey.
    static var appPaletteThird: UIColor {
        if #available(iOS 13, *) {
            return UIColor(named: "appPaletteThird")!
        }
        return UIColor(rgb: 0x7C91A2)
    }

    /// Light mode color is Green. Dark mode color is Green.
    static var appPaletteFourth: UIColor {
        if #available(iOS 13, *) {
            return UIColor(named: "appPaletteFourth")!
        }
        return UIColor(rgb: 0x7EC027)
    }

    /// Light mode color is Red. Dark mode color is Red.
    static var appPaletteFifth: UIColor {
        if #available(iOS 13, *) {
            return UIColor(named: "appPaletteFifth")!
        }
        return UIColor(rgb: 0xE74C3C)
    }

    /// Light mode color is Orange. Dark mode color is Orange.
    static var appPaletteSixth: UIColor {
        if #available(iOS 13, *) {
            return UIColor(named: "appPaletteSixth")!
        }
        return UIColor(rgb: 0xF7941D)
    }

    /// Light mode color is Light Grey. Dark mode color is Light Grey.
    static var appPaletteSeventh: UIColor {
        if #available(iOS 13, *) {
            return UIColor(named: "appPaletteSeventh")!
        }
        return UIColor(rgb: 0xEEEEEE)
    }

    /// Light mode color is Ultra Light Grey. Dark mode color is Ultra Light Grey.
    static var appPaletteEighth: UIColor {
        if #available(iOS 13, *) {
            return UIColor(named: "appPaletteEighth")!
        }
        return UIColor(rgb: 0xFAFAFA)
    }
    
    /// Light mode color is White. Dark mode color is White.
    static var appPaletteNinenth: UIColor {
        if #available(iOS 13, *) {
            return UIColor(named: "appPaletteNinenth")!
        }
        return UIColor(rgb: 0xFFFFFF)
    }
    
    
}
