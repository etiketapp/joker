//
//  QuestionConstants.swift
//  Rapunzel
//
//  Created by tunay alver on 10.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import Foundation

class QuestionConstants {
    
    static let categoryNames = ["Any","General Knowledge", "Books", "Film", "Music", "Musicals and Theatres", "Television", "Video Games", "Board Games", "Science & Nature", "Computer", "Mathematics", "Gadgets", "Mythology", "Sports", "Geography", "History", "Politics", "Art", "Celebrities", "Animals", "Vehicles", "Comics", "Anime", "Cartoon"]
    
    
    static let difficulties = ["Any", "Easy", "Medium", "Hard"]
    
    static let types = ["Any", "Multiple Choice", "True / False"]
    
    static func createCategories() -> [Category] {
        var categories = [Category]()
        var counter = 8
        for name in categoryNames {
            let category = Category(name: name, id: counter)
            counter += 1
            categories.append(category)
        }
        return categories
    }
    
}
