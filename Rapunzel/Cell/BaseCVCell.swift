//
//  BaseCVCell.swift
//  Rapunzel
//
//  Created by tunay alver on 11.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

class BaseCVCell: UICollectionViewCell, NibLoadableView, ReusableView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .appPaletteNinenth
    }
    
}
