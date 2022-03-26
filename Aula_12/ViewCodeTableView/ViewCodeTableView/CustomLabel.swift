//
//  CustomLabel.swift
//  ViewCodeTableView
//
//  Created by Idwall Go Dev 008 on 24/03/22.
//

import UIKit

class CustomLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        numberOfLines = 0
        font = UIFont.systemFont(ofSize: 12, weight: .light)
        textColor = .systemGray
    }
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
