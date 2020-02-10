//
//  RequestResultArrayDelegate.swift
//  Rapunzel
//
//  Created by tunay alver on 1.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import Foundation

protocol RequestResultArrayDelegate: RequestDelegate {
    
    associatedtype ResultObjectType: Codable
    
    func didSuccess(_ result: ResponseArray<ResultObjectType>)
    
}

extension RequestResultArrayDelegate {
    
    func request(success: @escaping RequestManager.ArrayClosure<ResultObjectType>, failure: @escaping RequestManager.ErrorClosure) {
        RequestManager.request(self, success: { (result: ResponseArray<ResultObjectType>) in
            self.didSuccess(result)
            success(result)
        }) { (error) in
            self.didError(error)
            failure(error)
        }
    }
    
    func didSuccess(_ result: ResponseArray<ResultObjectType>) {}
    
}
