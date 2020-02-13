//
//  QuestionsPresenter.swift
//  Rapunzel
//
//  Created by tunay alver on 10.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

class QuestionsPresenter: QuestionsViewToPresenterProtocol {
    
    var view: QuestionsPresenterToViewProtocol!
    var router: QuestionsPresenterToRouterProtocol!
    
    var nick: String!
    var questionInfo: QuestionInfo!
    var questions: [Question]?
    
    var currentQuestionNumber: Int!
    var wildCardNumber: Int!
    
    func getQuestions(number: Int) {
        let request = QuestionsRequest(amount: questionInfo.amount, category: questionInfo.categoryRow, difficulty: questionInfo.difficulty, type: questionInfo.type)
        request.request(success: { (response) in
            self.questions = response.results
            self.shuffle()
            if self.questions?.count != self.questionInfo.amount {
                self.view.didGetZeroQuestions() //NOTE: - Should be named different
            }else {
                self.view.didGetQuestions()
            }
        }) { (error) in
            self.view.didGetError(error: error)
        }
    }
    
    func useWildCard() {
        guard wildCardNumber != 0 else {
            self.view.didGetErrorWildCard()
            return
        }
        
        delete(index: generateRandom())
        
        wildCardNumber -= 1
        view.didUseWildCard()
    }
    
    func generateRandom() -> Int {
        var random: Int!
        switch questions![currentQuestionNumber].type! {
        case .boolean:
            random = Int.random(in: 0 ... 1)
        case .multiple:
            random = Int.random(in: 0 ... 3)
        }
        return random
    }
    
    //MARK: -
    //NOTE: - Sometimes random generates the correct answers index i need to handle this too...
    func shouldDelete(index: Int) -> Bool {
        let correctAnswer = questions![currentQuestionNumber].correct_answer
        
        let shouldDeleteAnswer = questions![currentQuestionNumber].shuffledAnswers![index]
        if shouldDeleteAnswer != correctAnswer {
            return true
        }else {
            return false
        }
    }
    
    func delete(index: Int) {
        questions![currentQuestionNumber].shuffledAnswers!.remove(at: index)
    }
    
    //MARK: - Shuffle
    func shuffle() {
        for question in questions! {
            question.shuffleQuestions()
        }
    }
    
}
