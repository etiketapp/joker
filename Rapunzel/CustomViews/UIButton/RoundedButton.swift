//
//  RoundedButton.swift
//  Rapunzel
//
//  Created by tunay alver on 10.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedButton: UIButton {
    
    @IBInspectable
    var fontSize: CGFloat = 16
    
    @IBInspectable
    var shouldDisableShadow: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel?.font = UIFont.boldSystemFont(ofSize: fontSize)
        layer.cornerRadius = self.frame.height / 2
        setTitleColor(.appPaletteEighth, for: .normal)
        
        backgroundColor = .appPaletteSecond
        
        if !shouldDisableShadow {
            layer.masksToBounds = false
            layer.shadowRadius = 2
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowOpacity = 0.2
            layer.shadowOffset = CGSize(width: 0, height: 0.8)
        }
    }
    
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                self.alpha = 0.5
            } else {
                self.alpha = 1.0
            }
        }
    }
    
    override var isEnabled: Bool {
        didSet {
            if isEnabled {
                self.alpha = 1.0
            } else {
                self.alpha = 0.5
            }
        }
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        awakeFromNib()
    }
    
}
