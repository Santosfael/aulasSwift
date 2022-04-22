//
//  ServiceAPI.swift
//  DependencyInject
//
//  Created by Idwall Go Dev 008 on 30/03/22.
//

import Foundation
import UIKit

/// Esse enum de erros tem a herança do tipo Error
enum UserError: Error {
    case error(String)
    case urlInvalid
    case noDataAvailable
    case noProcessData
}

/// completion - trabalhar com validações, tipo metodos de sucesso e falhas
typealias completion = (Result<[User], UserError>) -> Void

/// voce cria uma padrão que se extende a outras funcionalidade, passa ser generialista, reutilizar, individualizar melhor, organizar melhor
/// tem uma garantia que 80% do seu projeto passa ser testavel
protocol ServiceApiProtocol: AnyObject {
    func getUsers(completion: @escaping completion)
    
    //func getUSers(id: String, @escaping completion)
}

/// Aqui tá recebendo a herança/assinatura do tipo: ServiceApiProtocol
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
