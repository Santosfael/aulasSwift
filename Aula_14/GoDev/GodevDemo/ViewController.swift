//
//  ViewController.swift
//  GodevDemo
//
//  Created by Idwall Go Dev 008 on 29/03/22.
//

import UIKit
import GoDev


class ViewController: UIViewController {
    
    lazy var button: GoDevButton = {
        let config = GoDevButton.Config.dark()
        let button = GoDevButton(config: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Favorito", for: .normal)
        return button
    }()
    
    lazy var content: GodevView = {
        
        let view = GodevView(bg: .lightGray, borderColor: .blue)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Demo"
        view.backgroundColor = .white
        
        view.addSubview(button)
        view.addSubview(content)
        
        NSLayoutConstraint.activate([
            content.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            content.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            content.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            content.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }


}

