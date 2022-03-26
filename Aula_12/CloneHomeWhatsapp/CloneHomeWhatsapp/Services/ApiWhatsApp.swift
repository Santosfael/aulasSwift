//
//  ApiWhatsApp.swift
//  CloneHomeWhatsapp
//
//  Created by Idwall Go Dev 008 on 25/03/22.
//

import Foundation

enum ChatError: Error {
    case urlInvalid
    case noProcessData
    case noDataAvariable
}

protocol ServicesProtocol {
    func getChat(completion: @escaping(Result<[Talk], ChatError>) -> Void)
}

class Service: ServicesProtocol {
    let session = URLSession.shared
    let url = "https://run.mocky.io/v3/e928f0d1-6ed1-4770-9e1e-c56d7d5acdd8"
    
    static var shared: Service = {
        let instance = Service()
        return instance
    }()
    
    func getChat(completion: @escaping(Result<[Talk], ChatError>) -> Void) {
        guard let url = URL(string: url) else { return completion(.failure(.urlInvalid))}
        let dataTask = session.dataTask(with: url) { data, _, _ in
            do {
                guard let jsonData = data else {
                    return completion(.failure(.noDataAvariable))
                }
                let decoder = JSONDecoder()
                let userResponse = try decoder.decode([Talk].self, from: jsonData)
                
                completion(.success(userResponse))
            } catch {
                completion(.failure(.noProcessData))
            }
        }
        
        dataTask.resume()
    }
    
    
}
