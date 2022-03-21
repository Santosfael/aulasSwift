//
//  CustomCollectionViewCell.swift
//  desafioList
//
//  Created by Idwall Go Dev 008 on 21/03/22.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var ceoImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameCompanyLabel: UILabel!
    
    static let identifier = "CustomCollectionViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(image: String, nameCeo: String, nameCompany: String) {
        
        ceoImage.loadImage(from: image)
        ceoImage.layer.cornerRadius = 30
        ceoImage.clipsToBounds = true
        
        nameLabel.text = nameCeo
        print("Company \(nameCompany)")
        nameCompanyLabel.text = nameCompany
    }

}

