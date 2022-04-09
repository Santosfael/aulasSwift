//
//  HomeRequest.swift
//  Marvel
//
//  Created by Idwall Go Dev 008 on 30/03/22.
//

import Foundation

enum HomeRequest: URLRequestProtocol {
    
    case home
    case details
    
    var baseURL: String {
        return Environment.baseURL
    }
    
    var path: String {
        /*
         MD5 = timestamp + private key + public key
         */
        let timestamp = NSDate().timeIntervalSince1970.description
        
        switch self {
        case .home:
            return "limit=30&ts=\(timestamp)&apiKey=\(Environment.publicKey)&hash="
        case .details:
            return "details=4235448114"
        }
    }
    
    var method: HTTPMethod {
        return .get
//        switch self {
//        case .home:
//            return .get
//        case .details:
//            return .post
//        }
    }
    
    
}
