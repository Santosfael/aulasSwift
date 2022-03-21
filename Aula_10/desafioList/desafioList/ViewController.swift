//
//  ViewController.swift
//  desafioList
//
//  Created by Idwall Go Dev 008 on 21/03/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ceoCollection: UICollectionView!
    
    //let times = ["Atletico-mg", "Corinthians", "Cruzeiro", "Flamengo", "Palmeiras", "Santos"]
    lazy var listCeos = [CeoCompany]() {
        didSet {
            DispatchQueue.main.async {
                self.ceoCollection.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        delegates()
        registerCell()
        collectionLayout()
        getCeoCompany()
        // Do any additional setup after loading the view.
    }
    
    private func delegates() {
        ceoCollection.delegate = self
        ceoCollection.dataSource = self
    }
    
    private func getCeoCompany() {
        Service.shared.getCeoCompany { result in
            switch result {
            case .success(let response):
                self.listCeos = response
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func registerCell() {
        let nib = UINib(nibName: CustomCollectionViewCell.identifier, bundle: nil)
        ceoCollection.register(nib, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
    }
    
    private func collectionLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.frame.size.width, height: 90)
        layout.minimumLineSpacing = 10
        ceoCollection.collectionViewLayout = layout
        ceoCollection.showsVerticalScrollIndicator = false
    }
}

extension ViewController: UICollectionViewDelegate {
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listCeos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell else { return UICollectionViewCell()}
        
        let ceoCompany = listCeos[indexPath.row]
        cell.setup(image: ceoCompany.photo, nameCeo: ceoCompany.name, nameCompany: ceoCompany.company.name)
        return cell
    }
    
    
}

