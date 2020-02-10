//
//  QuestionNumberRouter.swift
//  Rapunzel
//
//  Created by tunay alver on 10.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

class QuestionNumberRouter: QuestionNumberPresenterToRouterProtocol {
    
    var view: QuestionNumberViewController!
    
    class func createQuestionNumberModule() -> QuestionNumberViewController {
        let view: QuestionNumberViewController = storyboard.instantiateViewController()
        let presenter: QuestionNumberViewToPresenterProtocol = QuestionNumberPresenter()
        let router: QuestionNumberPresenterToRouterProtocol = QuestionNumberRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.router = router
        
        
        return view
    }
    
    static var storyboard: UIStoryboard {
        return UIStoryboard(name: "QuestionNumber", bundle: Bundle.main)
    }
    
    func gotoQuestions(nick: String, questionInfo: QuestionInfo) {
        let questions = QuestionsRouter.createQuestionsModule(nick: nick, questionInfo: questionInfo)
        view.navigationController?.pushViewController(questions, animated: true)
    }

}
