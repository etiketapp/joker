//
//  QuestionNumberPresenter.swift
//  Rapunzel
//
//  Created by tunay alver on 10.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

class QuestionNumberPresenter: QuestionNumberViewToPresenterProtocol {
    
    var view: QuestionNumberPresenterToViewProtocol!
    var router: QuestionNumberPresenterToRouterProtocol!
    
    var nick: String!
    var amount: Int!
    
    var selectedCategory: String?
    var selectedCategoryRow: Int?
    var selectedDifficulty: String?
    var selectedType: String?
    
    func goAction(delegate: QuestionsViewControllerDelegate) {
        let questionInfo = QuestionInfo(amount: amount, categoryRow: selectedCategoryRow, difficulty: selectedDifficulty, type: selectedType)
        router.gotoQuestions(nick: nick, questionInfo: questionInfo, delegate: delegate)
    }
    
}
