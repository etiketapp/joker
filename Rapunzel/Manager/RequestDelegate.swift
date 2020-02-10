//
//  RequestDelegate.swift
//  Rapunzel
//
//  Created by tunay alver on 1.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import Alamofire

protocol RequestDelegate {
    
    var path: String {get}
    var method: HTTPMethod {get}
    var parameters: Parameters? {get set}
    
    func didError( _ error: ResponseError)
    
}

extension RequestDelegate {
    
    func didError(_ error: ResponseError) {}
    
}
