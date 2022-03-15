//
//  ViewController.swift
//  Aula_06_Exercicio
//
//  Created by Idwall Go Dev 008 on 15/03/22.
//

import UIKit

public struct Cars {
    var carImg: String
    var manufacturer: String
    var modelCar: String
    var perDayCar: String
    var price: String
}

class ViewController: UIViewController {
    
    @IBOutlet weak var listCarTableView: UITableView!
    
    var cars : [Cars] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Carros disponíveis para locação"
        delegates()
        CarsInfo()
    }
    
    private func delegates() {
        listCarTableView.delegate = self
        listCarTableView.dataSource = self
    }
    
    private func CarsInfo() {
        cars = [Cars(carImg: "Audi", manufacturer: "Audi", modelCar: "RS 5 Coupé", perDayCar: "Ao Dia", price: "R$ 120"),
                Cars(carImg: "Porsche", manufacturer: "Porsche", modelCar: "Panamera", perDayCar: "Ao Dia", price: "R$ 350"),
                Cars(carImg: "Corvette_Z06", manufacturer: "Chevrolet", modelCar: "Corvette Z06", perDayCar: "Ao Dia", price: "R$ 620"),
                Cars(carImg: "Lambo", manufacturer: "Lamborghini", modelCar: "Huracan", perDayCar: "Ao Dia", price: "R$ 120"),
                Cars(carImg: "Volvo", manufacturer: "Volvo", modelCar: "XC40", perDayCar: "Ao Dia", price: "R$ 120"),
                Cars(carImg: "Lancer", manufacturer: "Mitsubishi", modelCar: "Lancer EVO X", perDayCar: "Ao Dia", price: "R$ 340")]
    }

}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
        let car = cars[indexPath.row]
        
        cell.setup(car: car)
        
        return cell
    }
    
    
}

