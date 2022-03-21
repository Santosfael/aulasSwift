//
//  Services.swift
//  AppNetworking
//
//  Created by Idwall Go Dev 008 on 18/03/22.
//

import Foundation

enum UserError: Error {
    case urlInvalid
    case noProcessData
    case noDataAvariable
}

protocol ServicesProtocol {
    //@escaping - é uma palavra usada para falar o ciclo de vida de um clojer, funcionamento parecido com async await TS
    func getUsers(completion: @escaping(Result<[User], UserError>) -> Void)
}

class Service: ServicesProtocol {
    let session = URLSession.shared
    let url = "https://run.mocky.io/v3/30e27c3a-2d1f-4ecf-9e5e-f6773519bab6"
    
    static var shared: Service = {
        let instance = Service()
        return instance
    }()
    
    func getUsers(completion: @escaping(Result<[User], UserError>) -> Void) {
        guard let url = URL(string: url) else { return completion(.failure(.urlInvalid))}
        //Ela começa com o estado suspenso
        let dataTask = session.dataTask(with: url) { data, _, _ in
            do {
                guard let jsonData = data else {
                    return completion(.failure(.noDataAvariable))
                }
                let decoder = JSONDecoder()
                let userResponse = try decoder.decode([User].self, from: jsonData)
                
                completion(.success(userResponse))
            } catch {
                completion(.failure(.noProcessData))
            }
        }
        
        dataTask.resume()
    }
}
