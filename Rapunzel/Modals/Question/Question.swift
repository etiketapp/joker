//
//  Question.swift
//  Rapunzel
//
//  Created by tunay alver on 11.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import Foundation

//NOTE: - Not struct because...
class Question: Codable {
    
    var category: String!
    var type: QuestionType!
    var difficulty: String!
    var question: String!
    var correct_answer: String!
    var incorrect_answers: [String]!
    
    var shuffledAnswers: [String]?
    
    func shuffleQuestions() {
        var questions = [String]()
        questions = self.incorrect_answers
        questions.append(correct_answer)
        questions.shuffle()
        shuffledAnswers = questions
    }
    
}


enum QuestionType: String, Codable {

    case boolean       = "boolean"
    case multiple      = "multiple"
    
    var apiValue: String {
        switch self {
        case .boolean:
            return "boolean"
        case .multiple:
            return "multiple"
        }
    }
    
    var name: String {
        switch self {
        case .boolean:
            return "Boolean"
        case .multiple:
            return "Multiple"
        }
    }
    
}
