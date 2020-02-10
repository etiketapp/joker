//
//  ValidatorRules.swift
//  Rapunzel
//
//  Created by tunay alver on 10.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import SwiftValidator

class ValidatorRules {
    
    //NOTE: - Max length will not work because of the limitation but i wanted to add it too.
    static var nickRules: [Rule] {
        let name: String = ValidatorRuleKeys.nick.name
        let requiredRule = RequiredRule(message: "\(name) should not be empty.")
        
        let minLength = 2
        let minRule = MinLengthRule(length: minLength, message: "\(name) must be minimum \(minLength) character.")
        
        let maxLength = 23
        let maxRule = MaxLengthRule(length: maxLength, message: "\(name) must be maximun \(maxLength) character.")
        return [requiredRule, minRule, maxRule]
    }
    
    static var numberRules: [Rule] {
        let name: String = ValidatorRuleKeys.number.name
        let requiredRule = RequiredRule(message: "\(name) should not be empty.")
        
        let minLength = 1
        let minRule = MinLengthRule(length: minLength, message: "\(name) must be minimum \(minLength) character.")
        
        let maxLength = 2
        let maxRule = MaxLengthRule(length: maxLength, message: "\(name) must be maximun \(maxLength) character.")
        
        return [requiredRule, minRule, maxRule]
    }
    
    static var categoryRules: [Rule] {
        let name: String = ValidatorRuleKeys.category.name
        let requiredRule = RequiredRule(message: "\(name) should not be empty.")
        return [requiredRule]
    }
    
    static var difficultyRules: [Rule] {
        let name: String = ValidatorRuleKeys.difficulty.name
        let requiredRule = RequiredRule(message: "\(name) should not be empty.")
        return [requiredRule]
    }
    
    static var typeRules: [Rule] {
        let name: String = ValidatorRuleKeys.type.name
        let requiredRule = RequiredRule(message: "\(name) should not be empty.")
        return [requiredRule]
    }
    
}

//MARK: - Validator Rule Keys
enum ValidatorRuleKeys: String, CaseIterable {
    
    case nick       = "Nick"
    case number     = "Number"
    case category   = "Category"
    case difficulty = "Difficulty"
    case type       = "Type"
    
    var key: String {
        get { self.rawValue }
    }
    
    var name: String {
        switch self {
        case .nick:
            return "Nick"
        case .number:
            return "Number"
        case .category:
            return "Category"
        case .difficulty:
            return "Difficulty"
        case .type:
            return "Type"
        }
    }
    
}
