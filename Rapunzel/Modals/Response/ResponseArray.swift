//
//  ResponseArray.swift
//  Rapunzel
//
//  Created by tunay alver on 1.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import Foundation

class ResponseArray<T: Codable>: BaseResponse {
    
    var results: [T]!
    
    enum ResponseArrayCodingKeys: String, CodingKey {
        case results
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ResponseArrayCodingKeys.self)
        results = try container.decode([T].self, forKey: .results)
        try super.init(from: decoder)
    }
    
}
