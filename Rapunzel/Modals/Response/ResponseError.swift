//
//  ResponseError.swift
//  Rapunzel
//
//  Created by tunay alver on 1.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import Foundation

struct ResponseError: Codable {
    
    var code: String!
    var message: String!
    
    init() {    }
    
    init(code: String, message: String) {
        self.code = code
        self.message = message
    }
    
}
