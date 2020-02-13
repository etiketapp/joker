//
//  AppLabel.swift
//  Rapunzel
//
//  Created by tunay alver on 12.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

class AppLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        textColor = .appPaletteFirst
    }

}
