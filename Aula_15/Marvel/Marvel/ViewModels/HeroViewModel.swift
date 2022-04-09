//
//  HeroViewModel.swift
//  Marvel
//
//  Created by Idwall Go Dev 008 on 31/03/22.
//

import Foundation

class HeroViewModel {
    
    weak var delegates: HeroViewModelDelegate?
    
    private var services: HeroListServiceProtocol
    
    var hero: Hero?
    
    init(services: HeroListServiceProtocol) {
        self.services = services
    }
    
    func fetchHero() {
        services.execute { result in
            switch result {
            case .success(let hero):
                self.success(hero: hero)
                //print("Hero \(hero)")
            case .failure(let error):
                self.error(error: error.localizedDescription)
                //print("Error: \(error)")
            }
        }
    }
    
    private func success(hero: Hero) {
        self.hero = hero
        delegates?.heroFetchWithSucess()
    }
    
    private func error(error: String) {
        delegates?.errorToFetchHero(error)
    }
}
