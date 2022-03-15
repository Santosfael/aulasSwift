//
//  ItemCollectionViewCell.swift
//  Aula_06_03
//
//  Created by Idwall Go Dev 008 on 14/03/22.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageLogo: UIImageView!
    
    static let identifier = "ItemCollectionViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(image: String) {
        if let image = UIImage(named: image) {
            imageLogo.image = image
        }
    }

}
