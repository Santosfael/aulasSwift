//
//  ScoundViewController.swift
//  ViewCodeTableView
//
//  Created by Idwall Go Dev 008 on 25/03/22.
//

import UIKit

class SecoundViewController: UIViewController {
    
    lazy var closeButton: UIButton = {
        let button = UIButton(type: .close)
        button.tintColor = .red
        button.addTarget(self, action: #selector(closeModal), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public var idProduct: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        // Do any additional setup after loading the view.
        if let idProduct = idProduct {
            print(idProduct)
        }
        
        view.addSubview(closeButton)
        
        NSLayoutConstraint.activate([
            closeButton.heightAnchor.constraint(equalToConstant: 30),
            closeButton.widthAnchor.constraint(equalToConstant: 30),
            closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 15),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15)
        ])
    }
    
    @objc func closeModal() {
        dismiss(animated: true) {
            print("Terminou o dismiss")
        }
    }

}
