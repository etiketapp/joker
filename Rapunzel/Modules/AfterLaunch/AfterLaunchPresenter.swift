//
//  AfterLaunchPresenter.swift
//  Rapunzel
//
//  Created by tunay alver on 1.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

class AfterLaunchPresenter: AfterLaunchViewToPresenterProtocol {
    
    var view: AfterLaunchPresenterToViewProtocol!
    var router: AfterLaunchPresenterToRouterProtocol!
    
    //MARK: - Functions
    func launch() {
        view.didLaunch()
    }
    
    func shouldGotoQuestionNumber() {
        router.gotoQuestionNumber()
    }
    
}
