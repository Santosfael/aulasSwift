//
//  ViewController.swift
//  DependencyInject
//
//  Created by Idwall Go Dev 008 on 30/03/22.
//

import UIKit

/*
 Injeção de independencia é uma tecnica que um objeto recebe outro objeto na qual ele depende
 */
class ViewController: UIViewController {
    /// injeção de dependencia via propriedade
    /// Quando se injeta por propriedade não precisa de instanciar um init/ construtor para inicializar a minha injeção
    let api = ServiceAPI()
    
    /// inicializador
//    private let apiUser: ServiceAPI?
//
//    init(apiUser: ServiceAPI) {
//        Aqui está passando via construtor
//        self.apiUser = apiUser
//        super.init(nibName: nil, bundle: nil)
//    }
    
    /// Inversão de dependencia / inversão de controle
    /// aqui tá herdando/assinando
    /// Abaixo desse cara tá o inicializador
    private let apiServiceProtocol: ServiceApiProtocol?
    /// Instanciando o init/ construtor para injetar a dependencia
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

