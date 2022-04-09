//
//  HTTPMethod.swift
//  Marvel
//
//  Created by Idwall Go Dev 008 on 30/03/22.
//

import Foundation

enum HTTPMethod: String {
    
    /// Defines the suported types of HTTP methods
    case post
    case put
    case `get`
    case delete
    case path
    
    public var name: String {
        return rawValue.uppercased()
    }
}
