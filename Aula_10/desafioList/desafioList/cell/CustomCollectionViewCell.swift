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
    
    func setup(ceoCompany: CeoCompany) {
        
        ceoImage.loadImage(from: ceoCompany.photo)
        ceoImage.layer.cornerRadius = 30
        ceoImage.clipsToBounds = true
        
        nameLabel.text = ceoCompany.name
        nameCompanyLabel.text = ceoCompany.company.name
    }

}

