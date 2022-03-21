//
//  Services.swift
//  desafioList
//
//  Created by Idwall Go Dev 008 on 21/03/22.
//

import Foundation

enum CeoCompanyError: Error {
    case urlInvalid
    case noProcessData
    case noDataAvariable
}

protocol ServicesProtocol {
    func getCeoCompany(completion: @escaping(Result<[CeoCompany], CeoCompanyError>) -> Void)
}

class Service: ServicesProtocol {
    let session = URLSession.shared
    let url = "https://run.mocky.io/v3/f0c36709-84e2-4043-a0f0-3bec512f6c84"
    
    static var shared: Service = {
        let instance = Service()
        return instance
    }()
    
    func getCeoCompany(completion: @escaping (Result<[CeoCompany], CeoCompanyError>) -> Void) {
        guard let url = URL(string: url) else {return completion(.failure(.urlInvalid))}
        
        let ceoCampanyData = session.dataTask(with: url) { data, _, _ in
            do {
                guard let jsonData = data else {
                    return completion(.failure(.noDataAvariable))
                }
                let decoder = JSONDecoder()
                let ceoCompanyResponse = try decoder.decode([CeoCompany].self, from: jsonData)
                
                completion(.success(ceoCompanyResponse))
            } catch {
                completion(.failure(.noProcessData))
            }
            
        }
        ceoCampanyData.resume()
    }
    
    
}
