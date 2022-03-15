//
//  CustomTableViewCell.swift
//  Aula_06_Exercicio
//
//  Created by Idwall Go Dev 008 on 15/03/22.
//

import UIKit


class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var carImageView: UIImageView!
    @IBOutlet weak var manufacturerLabel: UILabel!
    @IBOutlet weak var modelCarLabel: UILabel!
    @IBOutlet weak var perDayLabel: UILabel!//AoDiaLabel
    @IBOutlet weak var priceLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setup(car: Cars) {
        carImageView.image = UIImage(named: car.carImg)
        manufacturerLabel.text = car.manufacturer
        modelCarLabel.text = car.modelCar
        perDayLabel.text = car.perDayCar
        priceLabel.text = car.price
    }

}
