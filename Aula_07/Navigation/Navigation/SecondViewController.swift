//
//  SecondViewController.swift
//  Navigation
//
//  Created by Idwall Go Dev 008 on 15/03/22.
//

import UIKit

class SecondViewController: UIViewController {
    
    private var property: Data?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let property = property {
            print("Esse valor é o valor que estou recebendo: \(property.name)")
        }
    }
    
    func setData(data: Data) {
        self.property = data
    }

}
