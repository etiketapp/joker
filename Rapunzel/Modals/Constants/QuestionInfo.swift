//
//  QuestionInfo.swift
//  Rapunzel
//
//  Created by tunay alver on 11.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import Foundation

struct QuestionInfo {
    
    var amount: Int!
    var categoryRow: Int?
    var difficulty: String?
    var type: String?
    
    init(amount: Int, categoryRow: Int?, difficulty: String?, type: String?) {
        self.amount = amount
        self.categoryRow = categoryRow
        self.difficulty = difficulty
        self.type = type
    }
    
}
