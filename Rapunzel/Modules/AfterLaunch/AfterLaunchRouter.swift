//
//  AfterLaunchRouter.swift
//  Rapunzel
//
//  Created by tunay alver on 1.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

class AfterLaunchRouter: AfterLaunchPresenterToRouterProtocol {
    
    class func createAfterLaunchModule() -> AfterLaunchViewController {
        
        let view: AfterLaunchViewController = storyboard.instantiateViewController()
        let presenter: AfterLaunchViewToPresenterProtocol = AfterLaunchPresenter()
        let router: AfterLaunchPresenterToRouterProtocol = AfterLaunchRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.router = router
        
        return view
    }
    
    static var storyboard: UIStoryboard {
        return UIStoryboard(name: "AfterLaunch", bundle: Bundle.main)
    }

    func gotoQuestionNumber() {
        let questionNumber = QuestionNumberRouter.createQuestionNumberModule()
        let navigationController = BaseNavigationController(rootViewController: questionNumber)
        AppDelegate.shared.goToScreen(view: navigationController)
    }
    
}
