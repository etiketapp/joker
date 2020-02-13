//
//  LoadingViewPresenter.swift
//  Rapunzel
//
//  Created by tunay alver on 12.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit
import TinyConstraints

class LoadingViewPresenter {
    
    static let shared = LoadingViewPresenter()
    
    func hide() {
        for window in UIApplication.shared.windows {
            for item in window.subviews where item is LoadingView {
                item.removeFromSuperview()
            }
        }
    }
    
    func show() {
        guard let keyWindow = UIApplication.shared.keyWindow else {
            return
        }
        
        let loadingView = LoadingView(frame: UIScreen.main.bounds)
        keyWindow.addSubview(loadingView)
        
        loadingView.left(to: keyWindow)
        loadingView.right(to: keyWindow)
        loadingView.bottom(to: keyWindow)
        loadingView.top(to: keyWindow)
    }
}
