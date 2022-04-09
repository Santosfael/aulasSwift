//
//  Environment.swift
//  Marvel
//
//  Created by Idwall Go Dev 008 on 30/03/22.
//

import Foundation

enum Environment {
    static var baseURL: String {
        return Constants.baseURL
    }
    
    static var publicKey: String {
        return Constants.publicKey
    }
    
    static var privateKey: String {
        return Constants.privateKey
    }
    
    static var token: String {
        return Constants.token
    }
}
