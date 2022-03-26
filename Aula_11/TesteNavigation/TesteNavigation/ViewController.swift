//
//  ViewController.swift
//  TesteNavigation
//
//  Created by Idwall Go Dev 008 on 22/03/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .orange
        title = "App 1"
    }
    
    @IBAction func getViewController() {
        let customUrl = "NavigationSchemes://"
        if let url = URL(string: customUrl) {
            //shared - meu singonto para que não precise estanciar a UIAplication
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
        }
    }


}

