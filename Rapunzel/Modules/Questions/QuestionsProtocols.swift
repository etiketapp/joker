//
//  QuestionsProtocols.swift
//  Rapunzel
//
//  Created by tunay alver on 10.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

protocol QuestionsViewToPresenterProtocol: class {
    
    var view: QuestionsPresenterToViewProtocol! { get set }
    var router: QuestionsPresenterToRouterProtocol! { get set }
    
    var nick: String! { get set }
    var questionInfo: QuestionInfo! { get set }
    var questions: [Question]? { get set }
    
    var currentQuestionNumber: Int! { get set }
    var wildCardNumber: Int! { get set }
    
    func getQuestions(number: Int)
    func useWildCard()
    
}

protocol QuestionsPresenterToViewProtocol: class {
    
    func didGetError(error: ResponseError)
    func didGetQuestions()
    func didGetZeroQuestions()
    
    func didUseWildCard()
    func didGetErrorWildCard()
    
}

protocol QuestionsPresenterToRouterProtocol: class {
    
}
