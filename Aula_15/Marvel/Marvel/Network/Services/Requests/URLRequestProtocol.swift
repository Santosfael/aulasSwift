//
//  URLRequestProtocol.swift
//  Marvel
//
//  Created by Idwall Go Dev 008 on 30/03/22.
//

import Foundation

protocol URLRequestProtocol {
    
    /// The Apis base url
    var baseURL: String { get }
    
    /// Denies the endpoint we want to hit
    var path: String { get }
    
    /// Relative to the method we want to call, that was defined with am enum above
    var method: HTTPMethod { get }
}
