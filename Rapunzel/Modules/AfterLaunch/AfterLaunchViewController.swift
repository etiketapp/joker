//
//  AfterLaunchViewController.swift
//  Rapunzel
//
//  Created by tunay alver on 1.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

class AfterLaunchViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet private weak var introImageView: UIImageView!
    
    // MARK: - Properties
    var presenter: AfterLaunchViewToPresenterProtocol!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        animateImage()
    }
    
    func animateImage() {
        introImageView.startShimmeringEffect()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.introImageView.stopShimmering()
            self.presenter.launch()
        }
    }
    
}

// MARK: - AfterLaunchPresenterOutputDelegate
extension AfterLaunchViewController: AfterLaunchPresenterToViewProtocol {
    func didLaunch() {
        presenter.shouldGotoQuestionNumber()
    }
}
