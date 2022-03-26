//
//  InforEditViewController.swift
//  CloneHomeWhatsapp
//
//  Created by Idwall Go Dev 008 on 25/03/22.
//

import UIKit

class InforEditViewController: UIViewController {
    
    lazy private var closeButton: UIButton = {
        let button = UIButton(type: .close)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .red
        button.addTarget(self, action: #selector(closeModal), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    @IBAction private func closeModal() {
        dismiss(animated: true) {
            print("Voltei para a tela inicial")
        }
    }

}

extension InforEditViewController: ViewCode {
    func buildHierarchy() {
        view.addSubview(closeButton)
    }
    
    func setupConstraints() {
        //Button closed
        NSLayoutConstraint.activate([
            closeButton.heightAnchor.constraint(equalToConstant: 30),
            closeButton.widthAnchor.constraint(equalToConstant: 30),
            closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 15),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
        ])
    }
    
    func applyAdditionalChanges() {
        view.backgroundColor = .systemBackground
    }
    
    
}
