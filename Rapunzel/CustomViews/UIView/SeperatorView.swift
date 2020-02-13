//
//  SeperatorView.swift
//  Rapunzel
//
//  Created by tunay alver on 11.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

@IBDesignable
class SeperatorView: UIView {
    
    @IBInspectable
    var bgColor: UIColor? = .appPaletteSecond {
        didSet {
            self.backgroundColor = bgColor
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = bgColor
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        awakeFromNib()
    }
    
}
