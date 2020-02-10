//
//  ResponseArray.swift
//  Rapunzel
//
//  Created by tunay alver on 1.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import Foundation

class ResponseArray<T: Codable>: BaseResponse {
    
    var search: [T]!
    
    enum ResponseArrayCodingKeys: String, CodingKey {
        case Search
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ResponseArrayCodingKeys.self)
        search = try container.decode([T].self, forKey: .Search)
        try super.init(from: decoder)
    }
    
}
