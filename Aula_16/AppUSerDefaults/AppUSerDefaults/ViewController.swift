//
//  ViewController.swift
//  AppUSerDefaults
//
//  Created by Idwall Go Dev 008 on 04/04/22.
//

import UIKit

class ViewController: UIViewController {
    
    private let defaults = UserDefaults.standard
    
    lazy var setValueButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Set value", for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(setUserDefaults), for: .touchUpInside)
        return button
    }()
    
    lazy var getValueButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Get Value", for: .normal)
        button.backgroundColor = .systemTeal
        button.addTarget(self, action: #selector(getUserDefaults), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        view.addSubview(setValueButton)
        view.addSubview(getValueButton)
        // Do any additional setup after loading the view.
        
        NSLayoutConstraint.activate([
            setValueButton.heightAnchor.constraint(equalToConstant: 45),
            setValueButton.widthAnchor.constraint(equalToConstant: view.frame.width / 2),
            setValueButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            setValueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            getValueButton.heightAnchor.constraint(equalToConstant: 45),
            getValueButton.widthAnchor.constraint(equalToConstant: view.frame.width / 2),
            getValueButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            getValueButton.topAnchor.constraint(equalTo: setValueButton.bottomAnchor, constant: 20)
        ])
    }
    
    @objc func setUserDefaults() {
        defaults.set("Atletico Mineiro", forKey: "time")
    }
    @objc func getUserDefaults() {
        let time = defaults.value(forKey: "time")
        if let time = time {
            print(time)
        }
    }


}

