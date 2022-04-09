//
//  ServiceAPI.swift
//  DependencyInject
//
//  Created by Idwall Go Dev 008 on 30/03/22.
//

import Foundation
import UIKit

enum UserError: Error {
    case error(String)
    case urlInvalid
    case noDataAvailable
    case noProcessData
}

typealias completion = (Result<[User], UserError>) -> Void

protocol ServiceApiProtocol: AnyObject {
    func getUsers(completion: @escaping completion)
    
    //func getUSers(id: String, @escaping completion)
}

class ServiceAPI: ServiceApiProtocol {
    func getUsers(completion: @escaping(Result<[User], UserError>) -> Void) {
        let user = [User(name: "Rafael", email: "rafaelsantoscv_@hotmail.com")]
        
        completion(.success(user))
    }
}

class xptoService: ServiceApiProtocol {
    func getUsers(completion: @escaping completion) {
        let user = [User(name: "Rafael Rocha", email: "rafaelsantoscv_@hotmail.com")]
        
        completion(.success(user))
    }
}

class apiFailureService: ServiceApiProtocol {
    func getUsers(completion: @escaping completion) {
        completion(.failure(.urlInvalid))
    }
}
