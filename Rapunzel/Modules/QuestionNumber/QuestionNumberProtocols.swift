//
//  QuestionNumberProtocols.swift
//  Rapunzel
//
//  Created by tunay alver on 10.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

protocol QuestionNumberViewToPresenterProtocol: class {
    
    var view: QuestionNumberPresenterToViewProtocol! { get set }
    var router: QuestionNumberPresenterToRouterProtocol! { get set }
    
    var nick: String! { get set }
    var amount: Int! { get set }
    var selectedCategory: String? { get set }
    var selectedCategoryRow: Int? { get set }
    var selectedDifficulty: String? { get set }
    var selectedType: String? { get set }
    
    func goAction(delegate: QuestionsViewControllerDelegate)
    
}

protocol QuestionNumberPresenterToViewProtocol: class {
    
}

protocol QuestionNumberPresenterToRouterProtocol: class {
    
    var view: QuestionNumberViewController! { get set }
    func gotoQuestions(nick: String, questionInfo: QuestionInfo, delegate: QuestionsViewControllerDelegate)
    
}
