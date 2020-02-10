//
//  QuestionsRouter.swift
//  Rapunzel
//
//  Created by tunay alver on 10.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

class QuestionsRouter: QuestionsPresenterToRouterProtocol {
    
    
    class func createQuestionsModule(nick: String, questionInfo: QuestionInfo) -> QuestionsViewController {
        let view: QuestionsViewController = storyboard.instantiateViewController()
        let presenter: QuestionsViewToPresenterProtocol = QuestionsPresenter()
        let router: QuestionsPresenterToRouterProtocol = QuestionsRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.router = router
        
        
        return view
    }
    
    static var storyboard: UIStoryboard {
        return UIStoryboard(name: "Questions", bundle: Bundle.main)
    }

}
