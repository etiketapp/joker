//
//  LoadingView.swift
//  Rapunzel
//
//  Created by tunay alver on 12.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit
import Lottie

class LoadingView: UIView {
    
    // MARK: - Objects & Definition
    private var loadingView = AnimationView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        let backgroundColor = UIColor.primaryBackground
        self.backgroundColor = backgroundColor.withAlphaComponent(0.5)
        
        loadingView.contentMode = .scaleAspectFit
        self.addSubview(loadingView)
        loadingView.width(200)
        loadingView.height(200)
        loadingView.centerX(to: self)
        loadingView.centerY(to: self)

        self.loadingView.loopMode = .loop
        
        let animation = Animation.named("loading")
        self.loadingView.animation = animation
        self.loadingView.play()
    }
}
