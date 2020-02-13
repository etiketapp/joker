//
//  QuestionsRouter.swift
//  Rapunzel
//
//  Created by tunay alver on 10.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

class QuestionsRouter: QuestionsPresenterToRouterProtocol {
    
    class func createQuestionsModule(nick: String, questionInfo: QuestionInfo, delegate: QuestionsViewControllerDelegate) -> QuestionsViewController {
        let view: QuestionsViewController = storyboard.instantiateViewController()
        let presenter: QuestionsViewToPresenterProtocol = QuestionsPresenter()
        let router: QuestionsPresenterToRouterProtocol = QuestionsRouter()
        
        view.presenter = presenter
        view.delegate = delegate
        
        presenter.view = view
        presenter.router = router
        
        presenter.nick = nick
        presenter.questionInfo = questionInfo
        presenter.currentQuestionNumber = 0
        presenter.wildCardNumber = 3
        
        return view
    }
    
    static var storyboard: UIStoryboard {
        return UIStoryboard(name: "Questions", bundle: Bundle.main)
    }
    
}
