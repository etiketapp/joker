//
//  UICollectionViewExtension.swift
//  Rapunzel
//
//  Created by tunay alver on 13.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    func scrollTo(row: Int) {
        self.scrollToItem(at: IndexPath(item: row, section: 0), at: .centeredHorizontally, animated: true)
    }
    
}
