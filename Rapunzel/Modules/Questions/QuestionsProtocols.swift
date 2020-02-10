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
    
    func getQuestions(number: Int)
    
}

protocol QuestionsPresenterToViewProtocol: class {
    
    func didGetError()
    func didGetQuestions()
    
}

protocol QuestionsPresenterToRouterProtocol: class {
    
}
