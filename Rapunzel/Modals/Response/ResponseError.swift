//
//  ResponseError.swift
//  Rapunzel
//
//  Created by tunay alver on 1.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import Foundation

struct ResponseError: Codable {
    
    var status_code: Int!
    var status_message: String!
    var success: Bool!
    
    init() {    }
    
    init(status_code: Int, status_message: String, success: Bool) {
        self.status_code = status_code
        self.status_message = status_message
        self.success = success
    }
    
}
