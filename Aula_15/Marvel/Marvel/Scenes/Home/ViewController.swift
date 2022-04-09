//
//  ViewController.swift
//  Marvel
//
//  Created by Idwall Go Dev 008 on 30/03/22.
//

import UIKit

class ViewController: UIViewController {
    
    var viewModel: HeroViewModel?
    
    private enum ViewState {
        case loading
        case normal
        case error
    }
    
    private var state: ViewState = .normal {
        didSet {
            self.setupView()
        }
    }
    
    private func setupView() {
        switch state {
        case .loading:
            print("carregando")
            //carrega o loading
        case .normal:
            print("Normal")
            //removo o loading
            //Table - atualização na tabela
        case .error:
            print("Error")
            // removo o loading
            //Notificar que alguma coisa deu errado
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        viewModel?.delegates = self
        
        state = .loading
//        service.execute { result in
//            switch result {
//
//            case .success(let hero):
//                print(hero)
//            case .failure(let error):
//                print(error)
//            }
//        }
    }
    
    private func fetchHero() {
        viewModel?.fetchHero()
    }


}

extension ViewController: HeroViewModelDelegate {
    func heroFetchWithSucess() {
        print("success")
        state = .normal
    }
    
    func errorToFetchHero(_ error: String) {
        print("Error")
        state = .error
    }
    
    
}

