//
//  AfterLaunchProtocols.swift
//  Rapunzel
//
//  Created by tunay alver on 1.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

protocol AfterLaunchViewToPresenterProtocol: class {
    
    var view: AfterLaunchPresenterToViewProtocol! { get set }
    var router: AfterLaunchPresenterToRouterProtocol! { get set }
    
    func shouldGotoQuestionNumber()
    func launch()
    
}

protocol AfterLaunchPresenterToViewProtocol: class {
    func didLaunch()
}

protocol AfterLaunchPresenterToRouterProtocol: class {
    
    func gotoQuestionNumber()
    
}
