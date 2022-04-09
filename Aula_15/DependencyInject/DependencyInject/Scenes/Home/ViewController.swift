//
//  ViewController.swift
//  DependencyInject
//
//  Created by Idwall Go Dev 008 on 30/03/22.
//

import UIKit

class ViewController: UIViewController {
    //ingeção de dependencia via propriedade
    let api = ServiceAPI()
    
    //inicializador
//    private let apiUser: ServiceAPI?
//
//    init(apiUser: ServiceAPI) {
//        self.apiUser = apiUser
//        super.init(nibName: nil, bundle: nil)
//    }
    //Construtor
    private let apiServiceProtocol: ServiceApiProtocol?
    
    init(apiServiceProtocol: ServiceApiProtocol) {
        self.apiServiceProtocol = apiServiceProtocol
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        
//        api.getUsers { result in
//            switch result {
//            case .success(let users):
//                print("users:\(users)")
//            case .failure(let error):
//                print("Error \(error.localizedDescription)")
//            }
//        }
        
//        apiUser?.getUsers(completion: { result in
//            switch result {
//            case .success(let users):
//                print("users:\(users)")
//            case .failure(let error):
//                print("Error \(error.localizedDescription)")
//            }
//        })
        
        apiServiceProtocol?.getUsers(completion: { result in
            switch result {
                
            case .success(let users):
                print("Users \(users)")
            case .failure(let error):
                print("Error \(error.localizedDescription)")
            }
        })
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}

