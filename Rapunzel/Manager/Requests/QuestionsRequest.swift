//
//  QuestionsRequest.swift
//  Rapunzel
//
//  Created by tunay alver on 11.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import Alamofire

struct QuestionsRequest: RequestResultArrayDelegate {
    
    typealias ResultObjectType = Question
    
    var path: String = ""
    var method: HTTPMethod = .get
    var parameters: Parameters?
    
    init(amount: Int!, category: Int?, difficulty: String?, type: String?) {
        parameters = [:]
        parameters!["amount"] = amount
        parameters!["category"] = category
        parameters!["difficulty"] = difficulty
        parameters!["type"] = type
    }
    
}
